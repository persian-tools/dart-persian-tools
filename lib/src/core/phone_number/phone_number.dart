import 'package:persian_tools/src/constants/phone_number/constants.dart';

import 'models.dart';

/// Returns the phone number prefix
String getPhonePrefix(String phoneNumber) {
  final matches = mobileRegex.allMatches(phoneNumber);

  if (matches.isNotEmpty) {
    return matches.first.group(1) ?? '';
  }

  return '';
}

/// Finds information such as province, type and model of phone number.
///
/// This function used the [getPhonePrefix] to find out the phone number prefix number and
/// used the [phoneNumberValidator] function to validate the phone number.
///
/// Supports the following phone number formats
/// 1. 00989123456789
/// 2. +989123456789
/// 3. 989123456789
/// 4. 09123456789
/// 5. 9123456789
OperatorDetail? getPhoneNumberDetail(String phoneNumber) {
  if (phoneNumberValidator(phoneNumber)) {
    final prefix = getPhonePrefix(phoneNumber);

    return operators[prefix];
  }

  return null;
}

/// validate phone number and returns true if the given String phone number matched with pattern
/// otherwise returns false.
bool phoneNumberValidator(String phoneNumber) {
  return mobileRegex.hasMatch(phoneNumber) &&
      prefixes.contains(getPhonePrefix(phoneNumber));
}

/// [String] Extension wrapper to use [getPhonePrefix], [getPhoneNumberDetail] and
/// [phoneNumberValidator] on String object
extension PhoneNumberExtension on String {
  String get phoneNumberPrefix => getPhonePrefix(this);

  OperatorDetail? get phoneNumberDetail => getPhoneNumberDetail(this);

  bool get isPhoneNumber => phoneNumberValidator(this);
}
