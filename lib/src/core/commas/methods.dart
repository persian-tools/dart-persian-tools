import '../digits/methods.dart';
import '../is_persian/methods.dart';

/// Takes an integer or string and add commas as separator
/// NOTE: it converts Fa digits to En digits
String addCommas(Object number) {
  if (number is! int && number is! String && number is! double) {
    throw Exception('Type should be String or int');
  }
  final numberStr = number.runtimeType is String
      ? number as String //
      : number.toString();
  final enNumberStr =
      isPersian(numberStr) ? convertFaToEn(numberStr) : numberStr;
  final decimalNumber = enNumberStr.split('.');
  final integerPart = decimalNumber[0].replaceAllMapped(
    RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
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
    number = number.replaceAll(RegExp(r',\s?'), '');
  }
  return num.parse(number);
}
