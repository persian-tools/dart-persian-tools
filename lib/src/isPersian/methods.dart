import './fa_chars.dart';

bool isPersian(String input, [bool isComplex = false, Pattern? trimPattern]) {
  trimPattern ??= RegExp('["' r"'-+()؟\s.]");
  var rawText = input.replaceAll(trimPattern, '');
  var faRegExp = isComplex ? faComplexText : faText;
  return RegExp('^[$faRegExp]+\$').hasMatch(rawText);
}
