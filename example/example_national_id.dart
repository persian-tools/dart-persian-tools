import 'package:persian_tools/persian_tools.dart';

void main() {
  var nationalID = '0684159414';
  print(verifyIranianNationalId(nationalID)); // true

  ///the nationalID should contain 10 digit, so the following verifications
  ///should return false
  nationalID = '00000';
  print(verifyIranianNationalId(nationalID)); // false

  nationalID = '';
  print(nationalID.isIranianNationalId); // false
}
