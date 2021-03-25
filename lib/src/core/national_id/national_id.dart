
/// check the [value] is an iranian national ID
bool  verifyIranianNationalId(String value){
  if (!RegExp(r'^\d{10}$').hasMatch(value)) return false;

  final nationalId = '0000$value'.substring(value.length + 4 - 10);

  if ((int.tryParse(nationalId.substring(3, 9)) ?? 0) == 0) return false;

  final lastNumber = int.parse(nationalId.substring(9, 10));

  var sum = 0;
  for (var i = 0; i < 9; i++) {
    sum += int.parse(nationalId.substring(i, i + 1)) * (10 - i);
  }

  sum = sum % 11;

  return (sum < 2 && lastNumber == sum) ||
      (sum >= 2 && lastNumber == 11 - sum);
}

extension NationalId on String {
  /// Checks the current [String] to verify if it has a national ID.
  bool get isIranianNationalId => verifyIranianNationalId(this);
}
