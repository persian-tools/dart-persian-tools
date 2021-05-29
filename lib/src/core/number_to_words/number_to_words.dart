import 'package:persian_tools/persian_tools.dart';
import 'package:persian_tools/src/constants/number_to_words/constants.dart';
import 'package:persian_tools/src/internal_methods.dart';

/// gets an [int] with 3 or less digits as input and converts it to persian
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

/// checks current [input] for negative [value] and deploying converting process
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

  if (words.endsWith(' و ')) words = words.substring(0, (words.length - 3));

  words = trim(isNegative ? 'منفی $words' : words);

  if (ordinal) words = addOrdinalSuffix(words);

  return words;
}

String? numberToWordsString(String number, {bool ordinal = false}) {
  if (number.isEmpty) return null;
  if (number == '0') return 'صفر';

  return _convert(removeCommas(number).toInt(), ordinal);
}

String? numberToWords(int number, {bool ordinal = false}) {
  if (number == 0) return 'صفر';
  return _convert(number, ordinal);
}

extension NumberToPersianWordsString on String {
  /// converts current [String] value to persian words
  String? convertNumToWords({bool ordinal = false}) => numberToWordsString(this, ordinal: ordinal);
}

extension NumberToPersianWordsInt on int {
  /// converts current [int] value to persian words
  String? convertNumToWords({bool ordinal = false}) => numberToWords(this, ordinal: ordinal);
}
