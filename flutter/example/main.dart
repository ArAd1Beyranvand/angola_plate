import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';
import 'package:angola_plate/angola_plate.dart';

void main() => runApp(
  PlateExampleApp(spec: AngolaPlates.standard, theme: AngolaThemes.standard),
);
