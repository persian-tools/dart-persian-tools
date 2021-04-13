import 'package:dart_persian_tools/dart_persian_tools.dart';

void main() {
  final place = getPlaceByIranNationalId('0084575948');
  print(place?.city.name); // تهران مرکزی
  print(place?.province.name); // تهران

  /// get place with extension methods over [String] class
  final nationalId = '2110990147';
  print(nationalId.getPlaceNationalId?.city.name); // گرگان
  print(nationalId.getPlaceNationalId?.province.name); // گلستان
}
