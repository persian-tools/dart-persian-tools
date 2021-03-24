import '../../constants/digits/constants.dart';

/// Takes a String that includes English digits and coverts them to Persian digits
String convertEnToFa(String digits) {
  for (var i = 0; i < 10; i++) {
    digits = digits.replaceAll('$i', faNumber[i]);
  }
  return digits;
}

/// Takes a String that includes Persian digits and converts them to English digits
String convertFaToEn(String digits) {
  for (var i = 0; i < 10; i++) {
    digits = digits.replaceAll('${faNumber[i]}', '$i');
  }
  return digits;
}

/// Takes a String that includes Arabic digits and converts them to Persian digits
String convertArToFa(String digits) {
  for (var i = 0; i < 10; i++) {
    digits = digits.replaceAll(arNumber[i], faNumber[i]);
  }
  return digits;
}

/// Takes a String that includes Arabic digits and converts them to English digits
String convertArToEn(String digits) {
  for (var i = 0; i < 10; i++) {
    digits = digits.replaceAll(arNumber[i], '$i');
  }
  return digits;
}
