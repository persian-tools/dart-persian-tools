import 'package:persian_tools/src/constants/add_ordinal_suffix/constants.dart';

/// Adds Ordinal Suffixes to numbers
/// for example :
/// ```dart
/// addOrdinalSuffix('سی'); // سی اُم
/// addOrdinalSuffix('سی دو'); // سی دوم
/// addOrdinalSuffix('پنج'); // پنجم
/// ```
String addOrdinalSuffix(String number) {
  if (number.endsWith(lastFaChar)) {
    return number + ordinalSuffixSeparate;
  }
  if (number.endsWith(three)) {
    return number.substring(0, number.length - 2) + third;
  }
  return number + ordinalSuffix;
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
