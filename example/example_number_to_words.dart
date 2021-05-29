import 'package:persian_tools/persian_tools.dart';

void main() {
  final stringDigit = '257,433';
  final intDigit = -128;

  /// use [numberToWordsString] method to convert [stringDigit] to persian
  print(numberToWordsString(stringDigit)); // 'دویست و پنجاه و هفت هزار و چهارصد و سی و سه'

  /// [numberToWordsString] also has an optional parameter
  /// by default [ordinal] is [false], [true] makes the output an ordinal word
  print(numberToWordsString(stringDigit, ordinal: true)); // 'دویست و پنجاه و هفت هزار و چهارصد و سی و سوم'

  /// use [numberToWordsInt] method to convert [intDigit] to persian
  print(numberToWordsInt(intDigit)); // 'منفی صد و بیست و هشت'

  /// [numberToWordsInt] also has an optional parameter
  /// by default [ordinal] is [false], [true] makes the output an ordinal word
  print(numberToWordsInt(intDigit, ordinal: true)); // 'منفی صد و بیست و هشتم'

  /// you can simply use extension methods on int or String objects
  print(stringDigit.convertNumToWordsString()); // 'دویست و پنجاه و هفت هزار و چهارصد و سی و سه'

  print(intDigit.convertNumToWordsInt()); // 'منفی صد و بیست و هشت'
}
