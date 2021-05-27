import 'package:persian_tools/persian_tools.dart';

void main() {
  final phoneNumber = '09022002580';

  final isValidPhoneNumber = phoneNumberValidator(phoneNumber);
  print(isValidPhoneNumber); // true

  final phoneNumberPrefix = getPhonePrefix(phoneNumber);
  print(phoneNumberPrefix); // 902

  final operatorDetail = getPhoneNumberDetail(phoneNumber);
  print(operatorDetail?.name); // ایرانسل
  print(operatorDetail?.provinces); // []
  print(operatorDetail?.base); // کشوری
  print(operatorDetail?.type); // SimCartType.both

  /// you can also use this methods as String extension method

  // phone number validator
  print(phoneNumber.isPhoneNumber); // true

  // phone number prefix
  print(phoneNumber.phoneNumberPrefix); // 902

  // phone number detail
  print(phoneNumber.phoneNumberDetail?.name); // ایرانسل
}
