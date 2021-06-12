import 'package:persian_tools/src/constants/remove_ordinal_suffix/constants.dart';

/// removes Ordinal Suffixes to numbers
/// for example :
/// ```dart
/// removeOrdinalSuffix('سه هزارم') // سث هزار
/// removeOrdinalSuffix('سه هزارمین') // سه هزار
/// ```
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

/// with RemoveOrdinalSuffix extension method you can use [removeOrdinalSuffix] method
/// as a getter on String object
/// ```dart
/// var number = 'سی سه';
/// number.withoutOrdinalSuffix; // سی سوم
/// ```
extension RemoveOrdinalSuffix on String {
  String get withoutOrdinalSuffix => removeOrdinalSuffix(this);
}
