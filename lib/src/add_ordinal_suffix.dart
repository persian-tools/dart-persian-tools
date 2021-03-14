/// Adds Ordinal Suffixes to numbers
/// for example :
/// ```dart
/// addOrdinalSuffix('سی'); // سی اٌم
/// addOrdinalSuffix('سی دو'); // سی دوم
/// ```
String addOrdinalSuffix(String number) {
  if (number.endsWith('ی')) {
    return number + ' اٌم';
  }
  if (number.endsWith('سه')) {
    return number.substring(0, 3) + 'سوم';
  }
  return number + 'م';
}

/// with AddOrdinalSuffix extension method you can use [addOrdinalSuffix] method
/// as a getter on String object
/// ```dart
/// var number = 'سی سه';
/// number.withOrdinalSuffix; // سی سوم
/// ```
extension AddOrdinalSuffix on String {
  // TODO: add Persian language checker on this object
  String get withOrdinalSuffix => addOrdinalSuffix(this);
}
