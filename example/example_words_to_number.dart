import 'package:persian_tools/persian_tools.dart';

void main() {
  final words = 'سه هزار دویست و دوازده';

  /// use [wordsToNumber] method to convert [words] to int number
  print(wordsToNumber(words)); // 3212

  /// use [wordsToNumberString] method to convert [words] to String
  print(wordsToNumberString(words)); // '3212' as String

  /// [wordsToNumberString] also has two optional parameter
  /// use [digit] optional parameter to convert the digits to specific local digits
  /// use [addComma] to add comma between the every 3 digits
  print(wordsToNumberString(
    words,
    digits: DigitLocale.fa,
    addComma: true,
  )); // '۳,۲۱۲' as String

  /// or you can easily use extension methods on String object
  print(words.convertWordsToNumber()); // 3212

  print(words.convertWordsToNumberString()); // '3212' as String
}
