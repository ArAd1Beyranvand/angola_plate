import 'package:plate_core/plate_core.dart';

import 'angola_colors.dart';

/// The plates carry no flag or country block, so every spec sets `noPanel`.
abstract final class AngolaCountry {
  static const PlateCountry angola = PlateCountry(
    code: 'ao',
    captionLines: <String>[],
    panelColor: AngolaColors.black,
    panelTextColor: AngolaColors.white,
  );
}
