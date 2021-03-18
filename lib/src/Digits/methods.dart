import './constants.dart';

/// Takes a String that includes English digits and coverts them to Persian digits
String convertEnToFa(String digits) {
  for (var i = 0; i < 10; i++) {
    digits = digits.replaceAll('$i', faNumber[i]);
  }
  return digits;
}
