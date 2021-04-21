import 'helper_classes.dart';
import 'helper_methods.dart';

class Plate {
  String plate;
  late NormalizedPlate normalizedPlate;

  Plate({required this.plate}) {
    normalizedPlate = normalizePlate(plate);
  }

  PlateInfo get info => getPlateInfo(normalizedPlate);

  bool get isValid => isPlateValid(info, normalizedPlate);
}
