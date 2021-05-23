import 'package:dart_persian_tools/dart_persian_tools.dart';

void main() {
  var motorcyclePlate = Plate(plate: '12345678');
  print(motorcyclePlate.info.type); // Motorcycle
  print(motorcyclePlate.info.template); // 123-45678
  print(motorcyclePlate.info.province); // مرکز تهران
  print(motorcyclePlate.info.category); // null because its type is Motorcycle
  print(motorcyclePlate.isValid); // true

  // because of persian language you may see plate in wrong form
  var carPlate = Plate(plate: '12ب14547');
  print(carPlate.info.type); // Car
  print(carPlate.info.template); // 12{B}145{Iran}47 , B=ب  Iran=ایران
  print(carPlate.info.province); // مرکزی
  print(carPlate.info.category); // شخصی
  print(carPlate.isValid); // true

  /// you can use create [Plate] with below String extension method

  var motorPlate =  '12345678'.createVehiclePlate;
  print(motorPlate.info.type); // Motorcycle
  print(motorPlate.info.template); // 123-45678
  print(motorPlate.info.province); // مرکز تهران
  print(motorPlate.info.category); // null because its type is Motorcycle
  print(motorPlate.isValid); // true

}
