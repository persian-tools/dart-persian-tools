import 'models.dart';

Bank? getBankNameFromCardNumber(String cardNumber) {
  return null;
}

extension BankNameFromCardNumber on String {
  Bank? get bankNameFromCard => getBankNameFromCardNumber(this);
}
