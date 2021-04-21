import 'package:dart_persian_tools/dart_persian_tools.dart';

void main() {
  print(validateCardNumber('6219861034529007')); // true
  print(validateCardNumber('6219861034529007')); // true
  print(validateCardNumber('0000000000000000')); // false
  print(validateCardNumber('621986103452900')); // false
}
