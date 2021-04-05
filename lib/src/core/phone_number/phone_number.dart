import 'package:dart_persian_tools/src/constants/phone_number/constants.dart';

import 'models.dart';

String getPhonePrefix(String mobile) {
  final matches = mobileRegex.allMatches(mobile);

  if (matches.isNotEmpty) {
    return matches.first.group(1) ?? '';
  }

  return '';
}


OperatorDetail? phoneNumberDetail(String phoneNumber) {
  //ToDo(payam) : implement this function
}

bool phoneNumberValidator(String phoneNumber) {
  //ToDo(payam) : implement this function
  return false;
}
