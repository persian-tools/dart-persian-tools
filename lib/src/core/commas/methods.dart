import '../digits/methods.dart';
import '../is_persian/methods.dart';

String addCommas(Object number) {
  if (number.runtimeType is! int || number.runtimeType is! String) {
    throw Exception('Type should be String or int');
  }
  final numberStr = number.runtimeType is String
      ? number as String
      : (number as int).toString();
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
