import 'package:dart_persian_tools/dart_persian_tools.dart';

void main() {
  var nationalID = '0684159414';
  print(nationalID.verifyIranianNationalId); // true

  ///the nationalID should contain 10 digit, so the following verifications
  ///should return false
  nationalID = '00000';
  print(nationalID.verifyIranianNationalId); // false

  nationalID = '';
  print(nationalID.verifyIranianNationalId); // false
}
