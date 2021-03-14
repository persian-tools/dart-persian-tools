/// Adds Ordinal Suffixes to numbers
/// for example :
/// ```dart
/// addOrdinalSuffix('سی') // سی اٌم
/// addOrdinalSuffix('سی دو') // سی دوم
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
