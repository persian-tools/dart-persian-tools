import 'package:dart_persian_tools/dart_persian_tools.dart';
import 'package:test/test.dart';

void main() {
  group('test get_place_by_national_id.dart', () {
    test('test getPlaceByIranNationalId return null values', () {
      expect(
        getPlaceByIranNationalId('008454594'),
        null,
      );

      expect(
        getPlaceByIranNationalId('8881234567'),
        null,
      );
    });

    test('test getPlaceByIranNationalId method', () {
      expect(
        getPlaceByIranNationalId('0499370899')?.city.name,
        equals('شهرری'),
      );

      expect(
        getPlaceByIranNationalId('0790419904')?.city.name,
        equals('سبزوار'),
      );

      expect(
        getPlaceByIranNationalId('0084575948')?.city.name,
        equals('تهران مرکزی'),
      );

      expect(
        getPlaceByIranNationalId('0060495219')?.city.name,
        equals('تهران مرکزی'),
      );

      expect(
        getPlaceByIranNationalId('0671658506')?.city.name,
        equals('بجنورد'),
      );

      expect(
        getPlaceByIranNationalId('0671658506')?.city.name,
        equals('بجنورد'),
      );

      expect(
        getPlaceByIranNationalId('0643005846')?.city.name,
        equals('بیرجند'),
      );

      expect(
        getPlaceByIranNationalId('0906582709')?.city.name,
        equals('کاشمر'),
      );

      expect(
        getPlaceByIranNationalId('0451727304')?.city.name,
        equals('شمیران'),
      );

      expect(
        getPlaceByIranNationalId('0371359058')?.city.name,
        equals('قم'),
      );

      expect(
        getPlaceByIranNationalId('5049478618')?.city.name,
        equals('پارس آباد'),
      );

      expect(
        getPlaceByIranNationalId('2110990147')?.city.name,
        equals('گرگان'),
      );

      expect(
        getPlaceByIranNationalId('0084545943')?.city.name,
        equals('تهران مرکزی'),
      );
    });
  });
}
