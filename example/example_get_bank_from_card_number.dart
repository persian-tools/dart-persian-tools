import 'package:dart_persian_tools/dart_persian_tools.dart';

void main() {
  final cardNumber = '6037701689095443';

  final bankInfo = getBankNameFromCardNumber(cardNumber);
  print(bankInfo?.name); // بانک کشاورزی
  print(bankInfo?.initCode); // 603770

  /// you can also use this methods as String extension method

  // get bank info from String
  print(cardNumber.bankNameFromCard?.name); // بانک کشاورزی
}
