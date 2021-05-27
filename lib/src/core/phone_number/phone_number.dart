import 'package:persian_tools/src/constants/phone_number/constants.dart';

import 'models.dart';

/// returns the phone number prefix
/// use it like:
/// ```dart
///   getPhonePrefix('09022002580'); // 902
/// ```
String getPhonePrefix(String phoneNumber) {
  final matches = mobileRegex.allMatches(phoneNumber);

  if (matches.isNotEmpty) {
    return matches.first.group(1) ?? '';
  }

  return '';
}

/// find information such as province, type and model of [phoneNumber]
/// this function used the [getPhonePrefix] to find out the [phoneNumber] prefix number and
/// used the [phoneNumberValidator] function to validate the [phoneNumber].
/// support the following phone number formats
/// 1. 00989123456789
/// 2. +989123456789
/// 3. 989123456789
/// 4. 09123456789
/// 5. 9123456789
///
/// use it like:
/// ```dart
/// final operatorDetail = getPhoneNumberDetail(phoneNumber);
/// print(operatorDetail?.name); // ایرانسل
/// print(operatorDetail?.provinces); // []
/// print(operatorDetail?.base); // کشوری
/// print(operatorDetail?.type); // SimCartType.both
/// ```
OperatorDetail? getPhoneNumberDetail(String phoneNumber) {
  if (phoneNumberValidator(phoneNumber)) {
    final prefix = getPhonePrefix(phoneNumber);

    return operators[prefix];
  }
}

/// validate [phoneNumber] and returns [true] if the [phoneNumber] parameter matched with pattern
/// otherwise returns false.
bool phoneNumberValidator(String phoneNumber) {
  return mobileRegex.hasMatch(phoneNumber) &&
      prefixes.contains(getPhonePrefix(phoneNumber));
}

extension PhoneNumberExtension on String {
  String get phoneNumberPrefix => getPhonePrefix(this);

  OperatorDetail? get phoneNumberDetail => getPhoneNumberDetail(this);

  bool get isPhoneNumber => phoneNumberValidator(this);
}
