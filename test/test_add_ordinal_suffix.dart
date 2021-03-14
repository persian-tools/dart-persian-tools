import 'package:dart_persian_tools/dart_persian_tools.dart';
import 'package:test/test.dart';

void main() {
  group('test add_ordinal_suffix.dart', () {
    group('test addOrdinalSuffix method', () {
      test('method on پنجاه سه', () {
        var number = 'پنجاه سه';
        expect(addOrdinalSuffix(number), equals('پنجاه سوم'));
      });
      test('method on سی دو', () {
        var number = 'سی دو';
        expect(addOrdinalSuffix(number), equals('سی دوم'));
      });
      test('method on شضت', () {
        var number = 'شضت';
        expect(addOrdinalSuffix(number), equals('شضت اُم'));
      });
    });
    group('test AddOrdinalSuffix extension', () {
      test('extension on پنجاه سه', () {
        var number = 'پنجاه سه';
        expect(number.withOrdinalSuffix, equals('پنجاه سوم'));
      });
      test('extension on سی دو', () {
        var number = 'سی دو';
        expect(number.withOrdinalSuffix, equals('سی دوم'));
      });
      test('extension on شضت', () {
        var number = 'شضت';
        expect(number.withOrdinalSuffix, equals('شضت اُم'));
      });
    });
  });
}
