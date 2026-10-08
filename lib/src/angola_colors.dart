import 'package:flutter/widgets.dart';

/// The colours of the 1996 Angolan plates.
///
/// The article says only "black on white". Sampled: the vector artwork
/// (`Angola_license_plate_graphic`) is `000000` on `FFFFFF`; the photograph
/// of a rear plate (`Angola_license_plate`) reads `1E1A18` and `FCFAF8` — the
/// same pair under a real camera — so the artwork's pure values are used for
/// both designs.
abstract final class AngolaColors {
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color inactive = Color(0xFF6E6E6E);
}
