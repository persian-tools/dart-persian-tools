import 'package:persian_tools/persian_tools.dart';
import 'package:persian_tools/src/constants/words_to_number/constants.dart';
import 'package:persian_tools/src/internal_methods.dart';

enum DigitLocale {
  en,
  fa,
  ar,
}

int compute(List<String> tokens) {
  var sum = 0;
  var isNegative = false;

  tokens.forEach((element) {
    final token = convertFaToEn(element);

    if (token == prefixes[0]) {
      isNegative = true;
    } else if (units[token] != null) {
      sum += units[token]!;
    } else if (ten[token] != null) {
      sum += ten[token]!;
    } else if (int.tryParse(token) != null) {
      sum += int.parse(token, radix: 10);
    } else {
      sum *= magnitude[token] ?? 1;
    }
  });
  return isNegative ? sum * -1 : sum;
}

List<String> tokenize(String words) {
  final temp = words.replaceMap(typoList);
  final result = <String>[];
  temp.split(' ').forEach((element) {
    if (element != joiners[0]) {
      result.add(element);
    }
  });
  return result;
}

int? wordsToNumber(String words) {
  if (words.isEmpty) return null;

  words = words.replaceAll(RegExp('مین\$', caseSensitive: false), '');

}

String wordsToNumberString(
  String words, {
  DigitLocale digits = DigitLocale.en,
  bool addComma = false,
}) {
  return '';
}
