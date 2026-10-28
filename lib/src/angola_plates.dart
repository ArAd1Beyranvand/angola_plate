import 'dart:math';

import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

import 'angola_country.dart';
import 'angola_themes.dart';

/// Where the ink sits on the 1996 Angolan plates, in plate units.
///
/// **One row** (`Angola_license_plate_graphic`, vector artwork, 520×110 as the
/// article gives): ink y 19.5–90.5 (71 tall, cy 55); cell centres at a pitch of
/// 45 — pairs centred 79, 197.7, 320.7, 439.5 — and dashes at 137, 261.6,
/// 380.8.
///
/// **Two rows** (`Angola_license_plate`, a photograph of a rear plate): the
/// offline stage flattened it to 520×110, but the photo's own aspect is 1.97,
/// so the canvas here is 520×264 and the flattened y values are scaled by 2.4.
/// The region code sits on the top row, y 18.7–128 (cy 73.6), letters centred
/// 212 and 310; the rest on the bottom row, y 137–254 (cy 195.4), pairs
/// centred 76, 270.3, 448.3 at a pitch of 65.5, dashes at 174 and 366. The
/// photo's screw heads are not reproduced.
///
/// The typeface is condensed — a one-row digit is 35 wide and 71 tall — so a
/// normal face is limited by the cell width, not its height. Each box is
/// about twice its pitch (the widest a glyph can grow before it is squeezed),
/// which leaves the ink at 60–80% of the reference height. The two-row top
/// row is limited by the canvas instead: a box centred on y 73.6 can be 147
/// tall. A bigger box cannot help; an estimate until goldens exist.
abstract final class _Layout {
  static const double width = 520;

  // One row.
  static const double rowHeight = 110, rowCy = 55, rowBox = 90, rowPitch = 45;
  static const List<double> rowDashes = <double>[137, 261.6, 380.8];
  static const double dashWidth = 18;

  // Two rows.
  static const double stackedHeight = 264;
  static const double topCy = 73.6, topBox = 147, topPitch = 98;
  static const double topFirstCx = 212;
  static const double bottomCy = 195.4, bottomBox = 131, bottomPitch = 65.5;
  static const List<double> bottomDashes = <double>[174, 366];
}

/// Two designs of AA-##-##-AA with groups `region`, `first`, `second`,
/// `suffix`: [standard] on one row, [stacked] with the region on its own row.
///
/// Both pair with the theme in [themeOf]. The earlier AAA-##-## series and the
/// 2024 redesign are not implemented.
abstract final class AngolaPlates {
  static final PlateSpec standard = _build(
    'ao.standard',
    height: _Layout.rowHeight,
    rows: const <_Row>[
      _Row(
        cy: _Layout.rowCy,
        box: _Layout.rowBox,
        pitch: _Layout.rowPitch,
        runs: <(String, double)>[
          ('region', 79),
          ('first', 197.7),
          ('second', 320.7),
          ('suffix', 439.5),
        ],
        dashes: _Layout.rowDashes,
      ),
    ],
  );

  static final PlateSpec stacked = _build(
    'ao.stacked',
    height: _Layout.stackedHeight,
    rows: const <_Row>[
      _Row(
        cy: _Layout.topCy,
        box: _Layout.topBox,
        pitch: _Layout.topPitch,
        runs: <(String, double)>[('region', _Layout.topFirstCx + 49)],
        dashes: <double>[],
      ),
      _Row(
        cy: _Layout.bottomCy,
        box: _Layout.bottomBox,
        pitch: _Layout.bottomPitch,
        runs: <(String, double)>[
          ('first', 76),
          ('second', 270.3),
          ('suffix', 448.3),
        ],
        dashes: _Layout.bottomDashes,
      ),
    ],
  );

  static PlateTheme themeOf(PlateSpec spec) =>
      spec.id == stacked.id ? AngolaThemes.stacked : AngolaThemes.standard;

  static List<PlateSpec> get all => <PlateSpec>[standard, stacked];

  static PlateSpec _build(
    String id, {
    required double height,
    required List<_Row> rows,
  }) {
    final slots = <PlateSlot>[];
    final groups = <PlateTextGroup>[];
    final labels = <PlateLabel>[];
    for (final row in rows) {
      for (final (key, centre) in row.runs) {
        final letters = key == 'region' || key == 'suffix';
        // One two-character field over both cells; the spacing brings the
        // font's ~0.6 em advance (glyph at 0.72 of the box) up to the pitch.
        groups.add(PlateTextGroup(<int>[slots.length], key: key));
        slots.add(
          PlateSlot(
            alphabet: letters
                ? AngolaAlphabets.letters
                : AngolaAlphabets.digits,
            box: PlateBox(
              centre - row.pitch,
              row.cy - row.box / 2,
              2 * row.pitch,
              row.box,
            ),
            length: 2,
            spacing: max(0, row.pitch - 0.6 * 0.72 * row.box),
          ),
        );
      }
      for (final dx in row.dashes) {
        labels.add(
          PlateLabel(
            text: '-',
            box: PlateBox(
              dx - _Layout.dashWidth / 2,
              row.cy - row.box / 2,
              _Layout.dashWidth,
              row.box,
            ),
            glyphHeight: row.box,
          ),
        );
      }
    }
    return PlateSpec(
      id: id,
      country: AngolaCountry.angola,
      canvasWidth: _Layout.width,
      canvasHeight: height,
      panel: const PlatePanel(box: PlateBox(0, 0, 0, 0)),
      noPanel: true,
      slots: slots,
      labels: labels,
      textGroups: groups,
    );
  }
}

/// A measured row: `runs` are pair groups by key and centre x.
class _Row {
  const _Row({
    required this.cy,
    required this.box,
    required this.pitch,
    required this.runs,
    required this.dashes,
  });

  final double cy, box, pitch;
  final List<(String, double)> runs;
  final List<double> dashes;
}
