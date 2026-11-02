/// Angola's licence plates for the `plate_core` library.
///
/// The 1996 white-on-black series in its one-row and two-row designs, a
/// theme each, Latin alphabets and an advisory validator.
library;

// TODO(py): [D5] one module `plates.countries.angola`; assets via importlib.resources.
// TODO(ts): [D5] one subpath export `./countries/angola`; tree-shakable.
// TODO(kt): [D5] package `countries.angola` in the countries module.
export 'package:plate_alphabet/plate_alphabet.dart' show AngolaAlphabets;

export 'src/angola_colors.dart';
export 'src/angola_country.dart';
export 'src/angola_plates.dart';
export 'src/angola_themes.dart';
export 'src/angola_validators.dart';
