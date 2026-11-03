import 'package:angola_plate/angola_plate.dart';
import 'package:plate_core/testing.dart';

void main() {
  plateGoldens('ao', AngolaCountry.angola, <String, PlateGoldenCase>{
    'standard': (AngolaPlates.standard, AngolaThemes.standard, 'LD 38 75 CL'),
    'stacked': (AngolaPlates.stacked, AngolaThemes.stacked, 'LD 17 99 DX'),
  });
}
