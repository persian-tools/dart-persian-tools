import 'package:persian_tools/persian_tools.dart';

void main() {
  print(convertArToFa('السلام علیکم 14۱۲۳6٤٥')); // السلام علیکم 14۱۲۳6۴۵
  print(convertArToEn('Persian Tools : 123٥٦٧')); // Persian Tools : 123567
  print(convertEnToFa(
      'سلام این هارو فارسی کن : 22۲۳۴')); // سلام این هارو فارسی کن : ۲۲۲۳۴
  print(convertFaToEn(
      'سلام این هارو اینگلیسی کن : 22۲۳۴')); // سلام این هارو اینگلیسی کن : 22234
}
