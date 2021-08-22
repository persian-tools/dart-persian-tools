import 'package:persian_tools/persian_tools.dart';

void main() {
  final intDigit = -128;

  /// use [numberToWords] method to convert [intDigit] to persian
  print(numberToWords(intDigit)); // 'منفی صد و بیست و هشت'

  /// [numberToWords] also has an optional parameter
  /// by default [ordinal] is [false], [true] makes the output an ordinal word
  print(numberToWords(intDigit, ordinal: true)); // 'منفی صد و بیست و هشتم'

  /// you can simply use extension methods on int or String objects
  print(intDigit.convertNumToWords()); // 'منفی صد و بیست و هشت'
}
