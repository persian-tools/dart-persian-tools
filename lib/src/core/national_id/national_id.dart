import 'package:persian_tools/src/constants/national_id/constants.dart';

/// Checks the given String is an iranian national ID or not
bool verifyIranianNationalId(String value) {
  if (!RegExp(isNumberRegExp).hasMatch(value)) return false;

  final nationalId = '0000$value'.substring(value.length + 4 - 10);

  if ((int.tryParse(nationalId.substring(3, 9)) ?? 0) == 0) return false;

  final lastNumber = int.parse(nationalId.substring(9, 10));

  var sum = 0;
  for (var i = 0; i < 9; i++) {
    sum += int.parse(nationalId.substring(i, i + 1)) * (10 - i);
  }

  sum = sum % 11;

  return (sum < 2 && lastNumber == sum) || (sum >= 2 && lastNumber == 11 - sum);
}

/// [String] Extension wrapper to checking iranian national id verification
extension NationalId on String {
  bool get isIranianNationalId => verifyIranianNationalId(this);
}
