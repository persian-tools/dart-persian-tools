import 'package:persian_tools/persian_tools.dart';

void main() {
  var number = 'چهل و سوم'; // سی سوم | سی اُم | شصتم | پنجاه دوم
  print(removeOrdinalSuffix(number)); // سی | شصت | پنجاه دو

  /// or use it as String extension method
  print(number.withoutOrdinalSuffix); // ... like so
}
