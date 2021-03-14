/// this file contains methods that is needed in other sources to avoid
/// code duplication

/// Custom trim method with custom regexp that helps us to remove whitespaces
String trim(String string) => string.replaceAll(RegExp(r'^\s+|\s+$'), '');

/// Arabic contextual forms in regexp
final arabicContextualForms = RegExp(r'/[ي|ﻱ|ﻲ|ﻚ|ك|ﻚ|ﺔ|ﺓ|ة]/g');

/// Takes two parameters - string and mapPattern - which are String and Map
/// and create a [RegExp] pattern form keys of Map and if keys matched , replace
/// matched string with corresponding value of key
String replaceMap(String string, Map<String, String> mapPattern) {
  // TODO: create test case and null checker for line:16
  var regexp = RegExp(mapPattern.keys.join('|'), caseSensitive: false);
  return string.replaceAllMapped(regexp, (match) => mapPattern[match.group(0)]);
}
