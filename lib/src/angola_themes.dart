import 'package:plate_core/plate_core.dart';

import 'angola_colors.dart';

/// White ink on a black field, the frame in the ink.
///
/// Measured off the artwork (520×110): the white frame line is 5.25–5.75 wide
/// (0.05 of the height) and sits 2.75 in from the edge; the engine paints the
/// frame to the edge, so that thin black margin is not reproduced. The
/// stacked plate is 2.4 times taller, so the same line is 0.02 of its height.
abstract final class AngolaThemes {
  /// The one-row plate.
  static final PlateTheme standard = _ink(0.05);

  /// The squarer two-row rear plate.
  static final PlateTheme stacked = _ink(0.02);
}

PlateTheme _ink(double border) => PlateTheme.monochrome(
  field: AngolaColors.black,
  ink: AngolaColors.white,
  inactive: AngolaColors.inactive,
  borderWidthRatio: border,
  plateRadiusRatio: 0.06,
);
