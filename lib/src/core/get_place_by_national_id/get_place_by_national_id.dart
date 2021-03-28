import 'package:dart_persian_tools/src/core/get_place_by_national_id/models.dart';

NationalIdPlace? getPlaceByIranNationalId(String nationalId) {
  return null;
}

extension PlaceByNationalId on String {
  NationalIdPlace? get getPlaceNationalId => getPlaceByIranNationalId(this);
}
