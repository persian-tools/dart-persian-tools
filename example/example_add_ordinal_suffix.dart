import 'package:persian_tools/persian_tools.dart';

void main() {
  var number = 'سی سه'; // سی | شصت | پنجاه دو
  print(addOrdinalSuffix(number)); // سی سوم | سی اُم | شصتم | پنجاه دوم
  print(number.withOrdinalSuffix); // ... like so
}
