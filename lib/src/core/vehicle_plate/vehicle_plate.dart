import 'package:persian_tools/src/constants/vehicle_plate/constants.dart';
import 'package:persian_tools/src/core/vehicle_plate/model.dart';

/// Returns car province name by the given key which is province code
String? _getCarProvince(int key) => plateDataset[0][key];

/// Returns motorcycle province name by the given key which is province code
String? _getMotorcycleProvince(int key) => plateDataset[1][key];

/// Returns category name by the given char
String? _getCategory(String key) => plateDataset[2][key];

final _nonDigit = RegExp(nonDigitRegExp);

typedef PlateHandler = PlateInfo Function(NormalizedPlate);

/// Normalizes the Plate (or separate char part from number part)
NormalizedPlate normalizePlate(String plate) {
  String numbers;
  String char;
  char = _nonDigit.allMatches(plate).map<String>((match) => match.group(0)!).join();
  numbers = plate.replaceAll(_nonDigit, '');

  return NormalizedPlate(numbers, char == '' ? null : char);
}

/// Checks plate number validation
bool isPlateNumberValid(String number) {
  if (_nonDigit.hasMatch(number)) return false;
  return number.split('').sublist(0, number.length - 1).every((digit) => int.parse(digit) != 0);
}

bool isPlateValid(PlateInfo plateInfo, NormalizedPlate normalizedPlate) {
  if (!isPlateNumberValid(normalizedPlate.numbers)) return false;
  if (plateInfo.type == 'Car' && plateInfo.category == null) return false;
  if (plateInfo.province == null) return false;
  return true;
}

PlateInfo getPlateInfo(NormalizedPlate plate) {
  var handler = getPlateHandler(plate);
  return handler(plate);
}

PlateHandler getPlateHandler(NormalizedPlate plate) {
  if (plate.numbers.length == 7) {
    return carHandler;
  } else if (plate.numbers.length == 8) {
    return motorcycleHandler;
  } else {
    throw Exception('Plate number should 8 or 7');
  }
}

PlateInfo carHandler(NormalizedPlate plate) {
  var provinceCode = int.parse(plate.numbers.substring(5, 7));
  var type = 'Car';
  var template = '${plate.numbers.substring(0, 2)}${plate.char}'
      '${plate.numbers.substring(2, 5)}ایران$provinceCode';
  var province = _getCarProvince(provinceCode);
  var category = _getCategory(plate.char ?? '');
  return PlateInfo(
    template: template,
    province: province,
    type: type,
    category: category,
  );
}

PlateInfo motorcycleHandler(NormalizedPlate plate) {
  var provinceCode = int.parse(plate.numbers.substring(0, 3));
  var type = 'Motorcycle';
  var template = '$provinceCode-${plate.numbers.substring(3)}';
  var province = _getMotorcycleProvince(provinceCode);
  return PlateInfo(
    template: template,
    province: province,
    type: type,
  );
}

class Plate {
  String plate;
  late NormalizedPlate normalizedPlate;

  Plate({required this.plate}) {
    normalizedPlate = normalizePlate(plate);
  }

  PlateInfo get info => getPlateInfo(normalizedPlate);

  bool get isValid => isPlateValid(info, normalizedPlate);
}

extension VehiclePlate on String {
  Plate get createVehiclePlate => Plate(plate: this);
}