import 'package:dart_persian_tools/dart_persian_tools.dart';

void main() {
  print(addCommas('3333')); // 3,333
  print(addCommas('۸۲۳۳۴۵')); // 823,345

  print(removeCommas('654,562')); // 654562
  print(removeCommas('3,365.255')); // 3365.255

  print('11222'.addComma); // 11,222
  print('4,544.562'.removeComma); // 4544.562
}
