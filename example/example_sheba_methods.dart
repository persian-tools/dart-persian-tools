import 'package:dart_persian_tools/dart_persian_tools.dart';

void main() {
  var sheba = Sheba('IR820540102680020817909002');
  print(sheba()); // Returns all the information about bank from sheba
  print(sheba.isValid); // true
}
