/// removes Ordinal Suffixes to numbers
/// for example :
/// ```dart
/// removeOrdinalSuffix('سه هزارم') // سث هزار
/// removeOrdinalSuffix('سه هزارمین') // سه هزار
/// ```
String removeOrdinalSuffix(String word) {
  if (word.isEmpty) return word;

  word = word
      .replaceAll(RegExp('مین\$', caseSensitive: false), '')
      .replaceAll(RegExp('(ام| اُم)\$', caseSensitive: false), '');
  if (word.endsWith('سوم')) {
    word = word.substring(0, word.length - 3) + 'سه';
  } else if (word.endsWith('م')) {
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
