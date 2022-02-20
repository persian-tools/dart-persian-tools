import 'package:persian_tools/persian_tools.dart';
import 'package:persian_tools/src/constants/number_to_words/constants.dart';
import 'package:persian_tools/src/internal_methods.dart';

/// Gets an [int] as input and checks if it's a negative number
bool _isNegative(int number) {
  return number < 0;
}

/// Returns error message for [input] with more than 16 digits
String _numberIsNotValidError() {
  return errorMessage;
}

/// Gets an [int] as input and if exists, returns persian word
String _getWord(int number) {
  return numberToWord[number] ?? '';
}

/// Gets an [String] input and add negative persian prefix to it
String _addNegativeSuffix(String number) {
  return 'منفی $number';
}

/// Gets an [int] as input and returns [unitName] for numbers over 1000
/// [_getUnitName] parameter is calculated by subtracting current [map] key
/// from [separated] length multiplied by 3
String _getUnitName(int numberOfZeros) {
  return numberOfZeros == 0
      ? ''
      : numberToWord[int.parse('1${"0" * numberOfZeros}')]!;
}

/// Gets an [int] with 3 or less digits as input and converts it to persian
/// [num] between 1 & 19,except for 10, are converted directly like other
/// numbers that divisible by 10
/// For other numbers, the remainder of dividing by 10 would be passed to
/// [_transformToWord]
String _transformToWord(int number) {
  if (number == 0) return '';
  if (number <= 19 && number != 10) return _getWord(number);

  final residual = number <= 99 ? number % 10 : number % 100;
  return residual == 0
      ? _getWord(number)
      : '${_getWord(number - residual)} و ${_transformToWord(residual)}';
}

/// Transform [input] to string, breaks the number into three digit
/// parts, assign the string to [separated], get each part's [unitName]
/// and [transformedVal] inside [map] function of [numberArr]. each separated
/// part is handled in [map]. After [map] function, [where] function checks
/// the result created by [map] and ignores the empty items.
/// Finally [toList] combines and returns the result of the parts as a [String]
String _performer(int number) {
  if (number <= 999) return _transformToWord(number);
  final separated = addCommas(number.toString()).split(',');
  final numberArr = separated
      .asMap()
      .entries
      .map((e) {
    final transformedVal = _transformToWord(int.parse(e.value, radix: 10));
    final unitName = _getUnitName((separated.length - (e.key + 1)) * 3);
    return transformedVal.isNotEmpty ? '$transformedVal $unitName' : '';
  })
      .where((element) => element.length > 1)
      .toList();
  return trim(numberArr.join(andFa));
}

/// Returns Persian word of the given number in int You can determine
/// returned string has ordinal suffix or not by `ordinal` flag.
/// The current [input] is passed to [_performer] as positive integer
/// If [input] is negative, prefix would be added to [_performer] result
/// If `ordinal` is true, suffix would be added to the result of [tmpResult]
String numberToWords(int number, {bool ordinal = false}) {
  if (number == 0) return zeroFa;
  if (number.toString().length > 16) return _numberIsNotValidError();
  final _tmpResult = _isNegative(number)
      ? _addNegativeSuffix(_performer(number.abs()))
      : _performer(number);
  return ordinal ? addOrdinalSuffix(_tmpResult) : _tmpResult;
}

/// [int] Extension wrapper to convert number to Persian word on int object
extension NumberToPersianWordsInt on int {
  String convertNumToWords({bool ordinal = false}) =>
      numberToWords(this, ordinal: ordinal);
}
