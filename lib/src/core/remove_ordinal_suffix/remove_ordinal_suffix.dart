/// removes Ordinal Suffixes to numbers
/// for example :
/// ```dart
/// removeOrdinalSuffix("سه هزارم") // سث هزار
/// removeOrdinalSuffix("سه هزارمین") // سه هزار
/// ```
String removeOrdinalSuffix(String number) {
  return number;
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
