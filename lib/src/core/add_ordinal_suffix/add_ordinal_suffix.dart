import 'package:persian_tools/src/constants/add_ordinal_suffix/constants.dart';

/// Adds ordinal suffixes to numbers
String addOrdinalSuffix(String number) {
  if (number.endsWith(lastFaChar)) {
    return number + ordinalSuffixSeparate;
  }
  if (number.endsWith(three)) {
    return number.substring(0, number.length - 2) + third;
  }
  return number + ordinalSuffix;
}

/// [String] Extension wrapper to adding ordinal suffix to String object
extension AddOrdinalSuffix on String {
  // TODO: add Persian language checker on this object
  String get withOrdinalSuffix => addOrdinalSuffix(this);
}
