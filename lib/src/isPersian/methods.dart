import './fa_chars.dart';

/// Check is the input string Persian or not
/// returns true if the input is matched with Farsi char dataset [RegExp], if not
/// returns false
bool isPersian(String input, [bool isComplex = false, Pattern? trimPattern]) {
  trimPattern ??= RegExp('["' r"'-+()؟\s.]");
  var rawText = input.replaceAll(trimPattern, '');
  var faRegExp = isComplex ? faComplexText : faText;
  return RegExp('^[$faRegExp]+\$').hasMatch(rawText);
}
