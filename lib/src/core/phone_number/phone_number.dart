import 'package:dart_persian_tools/src/constants/phone_number/constants.dart';

import 'models.dart';

String getPhonePrefix(String phoneNumber) {
  final matches = mobileRegex.allMatches(phoneNumber);

  if (matches.isNotEmpty) {
    return matches.first.group(1) ?? '';
  }

  return '';
}

OperatorDetail? getPhoneNumberDetail(String phoneNumber) {
  if (phoneNumberValidator(phoneNumber)) {
    final prefix = getPhonePrefix(phoneNumber);

    return operators[prefix];
  }
}

bool phoneNumberValidator(String phoneNumber) {
  return mobileRegex.hasMatch(phoneNumber) &&
      prefixes.contains(getPhonePrefix(phoneNumber));
}

extension PhoneNumberExtension on String {
  String get phoneNumberPrefix => getPhonePrefix(this);

  OperatorDetail? get phoneNumberDetail => getPhoneNumberDetail(this);

  bool get isPhoneNumber => phoneNumberValidator(this);
}
