import 'package:persian_tools/persian_tools.dart';

void main() {
  var sheba = Sheba('IR820540102680020817909002');
  var bank = sheba(); // Returns nullable object of BankInformation
  print(bank?.nickname); // nickname of bank
  print(bank?.name); // complete name of bank
  print(bank?.persianName); // complete persian name of bank
  print(bank?.code); // code of bank
  // true means with sheba package can take account number, false means package can't
  print(bank?.isAccountNumberAvailable);
  print(bank?.accountNumber); // account number in simple numbers
  print(bank?.formattedAccountNumber); // account number with hyphen
  print(bank?.process); // always is null just uses in call method in Sheba
  print(sheba.isValid); // true
  var b = BankInformation(
      nickname: 'parsian',
      name: 'Parsian Bank',
      persianName: 'بانک پارسیان',
      code: '054',
      isAccountNumberAvailable: true,
      accountNumber: '020817909002',
      formattedAccountNumber: '0020-0081790-002');
  print(bank == b);
}
