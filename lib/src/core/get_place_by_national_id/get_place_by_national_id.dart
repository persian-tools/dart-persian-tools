import 'package:persian_tools/src/constants/get_place_by_national_id/national_id_place_constants.dart';
import 'package:persian_tools/src/constants/get_place_by_national_id/province_constants.dart';
import 'package:persian_tools/src/core/get_place_by_national_id/models.dart';
import 'package:persian_tools/persian_tools.dart';

NationalIdPlace? getPlaceByIranNationalId(String nationalId) {
  if (!nationalId.isIranianNationalId) return null;

  print('its national id');

  final code = nationalId.substring(0, 3);
  final find = nationalIdPlaces.firstWhere(
    (place) => place?.codesAsString.contains(code) ?? false,
    orElse: () => null,
  );

  print('find object: $find');

  if (find != null) {
    final nationalIdProvince =
        provinces.firstWhere((province) => province.code == find.province.code);

    print('nationalIdProvince object: $nationalIdProvince');

    return find.copyWith(province: nationalIdProvince);
  }
  return null;
}

extension PlaceByNationalId on String {
  NationalIdPlace? get getPlaceNationalId => getPlaceByIranNationalId(this);
}
