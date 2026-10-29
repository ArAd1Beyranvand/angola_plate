import 'package:plate_core/plate_core.dart';

// TODO(py): [D4-code] hand-port; reason strings are the contract, keep them byte-identical.
// TODO(ts): [D4-code] hand-port; reason strings are the contract, keep them byte-identical.
// TODO(kt): [D4-code] hand-port; reason strings are the contract, keep them byte-identical.
/// Judges AA-##-##-AA: a two-letter region code, two pairs of digits and two
/// letters. Reports, never bars a keystroke.
class AngolaValidator extends GatedPlateValidator {
  const AngolaValidator();

  @override
  String get gateGroup => 'suffix';

  static const String reasonRegion = 'The region is two letters.';
  static const String reasonDigits = 'The number is two pairs of digits.';
  static const String reasonSuffix = 'The series is two letters.';

  // TODO(py): [H9] Python re: \d/\w match Unicode; keep explicit [0-9]/[A-Z] classes (or re.ASCII).
  // TODO(ts): [H9] same flavour as Dart; port as is, cover accept/reject in the vectors (D9).
  // TODO(kt): [H9] Regex engine differs per target (JVM/JS/Native): keep to portable syntax.
  static final RegExp _pair = RegExp(r'^[A-Z]{2}$');

  static bool _letters(String s) => _pair.hasMatch(s);

  @override
  PlateValidation judge(PlateEntry entry) {
    if (!_letters(entry.group('region'))) {
      return const PlateValidation.invalid(reasonRegion);
    }
    if (!isDigitsOfLength(entry.group('first'), 2) ||
        !isDigitsOfLength(entry.group('second'), 2)) {
      return const PlateValidation.invalid(reasonDigits);
    }
    if (!_letters(entry.group('suffix'))) {
      return const PlateValidation.invalid(reasonSuffix);
    }
    return const PlateValidation.valid();
  }
}
