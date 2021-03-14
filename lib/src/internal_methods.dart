/// this file contains methods that is needed in other sources to avoid
/// code duplication

/// Custom trim method with custom regexp that helps us to remove whitespaces
String trim(String string) => string.replaceAll(RegExp(r'/^\s+|\s+$/g'), '');

/// Arabic contextual forms in regexp
final arabicContextualForms = RegExp(r'/[ي|ﻱ|ﻲ|ﻚ|ك|ﻚ|ﺔ|ﺓ|ة]/g');

