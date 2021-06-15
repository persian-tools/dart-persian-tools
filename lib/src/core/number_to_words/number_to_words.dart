import 'package:persian_tools/persian_tools.dart';
import 'package:persian_tools/src/constants/number_to_words/constants.dart';
import 'package:persian_tools/src/internal_methods.dart';

/// Gets an [int] with 3 or less digits as input and converts it to persian
String _numToWord(int number) {
  var unit = 100;
  var result = '';

  while (unit > 0) {
    if ((number / unit).floor() * unit != 0) {
      if (numberToWord.containsKey(number)) {
        result += numberToWord[number]!;
        break;
      } else {
        result += '${numberToWord[(number / unit).floor() * unit]} و ';
        number %= unit;
      }
    }
    unit = (unit / 10).floor();
  }
  return result;
}

/// Checks current [input] for negative [value] and deploying converting process
String _convert(int number, bool ordinal) {
  var result = <String>[];

  final isNegative = number < 0;
  number = isNegative ? number * -1 : number;

  while (number > 0) {
    result.add(_numToWord(number % base));
    number = (number / base).floor();
  }
  if (result.length > 4) return '';

  for (var i = 0; i < result.length; i++) {
    if (result[i] != '' && i != 0) result[i] += ' ${scale[i]} و ';
  }
  result = result.reversed.toList();

  var words = result.join('');

  if (words.endsWith(endsWithAnd)) {
    words = words.substring(0, (words.length - 3));
  }

  words = trim(isNegative ? 'منفی $words' : words);

  if (ordinal) words = addOrdinalSuffix(words);

  return words;
}

/// Returns Persian word of the given number in String. Number can contain commas.
/// You can determine returned string has ordinal suffix or not by `ordinal` flag.
String? numberToWordsString(String number, {bool ordinal = false}) {
  if (number.isEmpty) return null;
  if (number == '0') return zeroFa;

  return _convert(removeCommas(number).toInt(), ordinal);
}

/// Returns Persian word of the given number in int You can determine
/// returned string has ordinal suffix or not by `ordinal` flag.
String numberToWords(int number, {bool ordinal = false}) {
  if (number == 0) return zeroFa;
  return _convert(number, ordinal);
}

/// [String] Extension wrapper to convert number to Persian word on String object
extension NumberToPersianWordsString on String {
  String? convertNumToWords({bool ordinal = false}) =>
      numberToWordsString(this, ordinal: ordinal);
}

/// [int] Extension wrapper to convert number to Persian word on int object
extension NumberToPersianWordsInt on int {
  String? convertNumToWords({bool ordinal = false}) =>
      numberToWords(this, ordinal: ordinal);
}
