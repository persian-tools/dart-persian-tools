import '../../constants/is_persian/constants.dart';

/// Check is the input string Persian or not
/// returns true if the input is matched with Farsi char dataset [RegExp], if not
/// returns false
bool isPersian(String input, [bool isComplex = false, Pattern? trimPattern]) {
  trimPattern ??= RegExp('["' r"'-+()؟\s.]");
  var rawText = input.replaceAll(trimPattern, '');
  var faRegExp = isComplex ? faComplexText : faText;
  return RegExp('^[$faRegExp]+\$').hasMatch(rawText);
}

/// Check is the input string includes Persian alphabet or not
/// returns true if the input is matched with Farsi char dataset [RegExp], if not
/// returns false
bool hasPersian(String input, [bool isComplex = false]) {
  var faRegExp = isComplex ? faComplexText : faText;
  return RegExp('[$faRegExp]').hasMatch(input);
}
