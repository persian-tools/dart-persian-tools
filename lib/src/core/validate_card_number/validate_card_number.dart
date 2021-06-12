/// Checks validation of the given ATM card number
bool validateCardNumber(String cardNumber) {
  if (cardNumber.length < 16 ||
      int.parse(cardNumber.substring(1, 11)) == 0 ||
      int.parse(cardNumber.substring(10)) == 0) return false;
  int sum = 0, even, subDigit;
  for (var i = 0; i < 16; i++) {
    even = i % 2 == 0 ? 2 : 1;
    subDigit = int.parse(cardNumber[i]) * even;
    sum += subDigit > 9 ? subDigit - 9 : subDigit;
  }
  return sum % 10 == 0;
}
