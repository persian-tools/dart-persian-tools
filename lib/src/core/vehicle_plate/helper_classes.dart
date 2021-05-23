import '../../constants/vehicle_plate/constants.dart';

/// A wrapper class to have better access to plateDataset constant list
abstract class PlateDataset {
  /// Returns car province name by the given key which is province code
  static String? getCarProvince(int key) => plateDataset[0][key];

  /// Returns motorcycle province name by the given key which is province code
  static String? getMotorcycleProvince(int key) => plateDataset[1][key];

  /// Returns category name by the given char
  static String? getCategory(String key) => plateDataset[2][key];
}

class NormalizedPlate {
  String numbers;
  String? char;

  NormalizedPlate(this.numbers, [this.char]);
}

class PlateInfo {
  String template;
  String? province;
  String type;
  String? category;

  PlateInfo({
    required this.template,
    this.province,
    required this.type,
    this.category,
  });
}
