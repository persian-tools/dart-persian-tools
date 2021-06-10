import 'package:persian_tools/src/constants/commas/constants.dart';
import 'package:persian_tools/src/core/digits/digits.dart';
import 'package:persian_tools/src/core/is_persian/is_persian.dart';

/// Takes an integer or string and add commas as separator
/// NOTE: it converts Fa digits to En digits
String addCommas(Object number) {
  if (number is! int && number is! String && number is! double) {
    throw Exception(exception);
  }
  final numberStr = number.runtimeType is String
      ? number as String //
      : number.toString();
  final enNumberStr =
      isPersian(numberStr) ? convertFaToEn(numberStr) : numberStr;
  final decimalNumber = enNumberStr.split('.');
  final integerPart = decimalNumber[0].replaceAllMapped(
    RegExp(addCommasRegExp),
    (matched) => '${matched[1]},',
  );
  String decimalPart;
  try {
    decimalPart = '.${decimalNumber[1]}';
  } on RangeError catch (e) {
    decimalPart = '';
  }
  return integerPart + decimalPart;
}

///Takes a string and it should be includes integer then remove all the commas
num removeCommas(String number) {
  if (number.contains(',')) {
    number = number.replaceAll(RegExp(removeCommasRegExp), '');
  }
  return num.parse(number);
}

/// [String] Extension wrapper for functions
extension CommasString on String {
  String get addComma => addCommas(this);

  num get removeComma => removeCommas(this);
}

/// [num] Extension wrapper for functions
extension CommasNum on num {
  String get addComma => addCommas(this);
}
