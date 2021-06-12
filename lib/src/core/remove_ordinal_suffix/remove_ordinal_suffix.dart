import 'package:persian_tools/src/constants/remove_ordinal_suffix/constants.dart';

/// Removes ordinal suffixes to numbers
String removeOrdinalSuffix(String word) {
  if (word.isEmpty) return word;

  word = word
      .replaceAll(RegExp(ordinalSuffix, caseSensitive: false), '')
      .replaceAll(RegExp(ordinalSuffixSeparate, caseSensitive: false), '');
  if (word.endsWith(thirdFa)) {
    word = word.substring(0, word.length - 3) + threeFa;
  } else if (word.endsWith(ordinalSuffixSingle)) {
    word = word.substring(0, word.length - 1);
  }

  return word;
}

/// [String] Extension wrapper to remove ordinal suffix on String object
extension RemoveOrdinalSuffix on String {
  String get withoutOrdinalSuffix => removeOrdinalSuffix(this);
}
