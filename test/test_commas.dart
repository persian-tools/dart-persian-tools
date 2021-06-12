import 'package:persian_tools/persian_tools.dart';
import 'package:test/test.dart';

void main() {
  group('test commas/commas.dart', () {
    test('addCommas method', () {
      // integer numbers in type [int] and [String]
      expect(addCommas(30000000), equals('30,000,000'));
      expect(addCommas('30000000'), equals('30,000,000'));
      expect(addCommas('30,000,000'), equals('30,000,000'));
      expect(addCommas('۳۰۰۰۰۰۰۰'), equals('30,000,000'));
      expect(addCommas(300), equals('300'));

      // float numbers in type [double] and [String]
      expect(addCommas('30,000,000.02'), equals('30,000,000.02'));
      expect(addCommas('12500.9'), equals('12,500.9'));
      expect(addCommas(12500.9), equals('12,500.9'));
      expect(addCommas('51000.123456789'), equals('51,000.123456789'));
    });
    test('removeCommas method', () {
      expect(removeCommas('30,000,000'), equals(30000000));
      expect(removeCommas('300'), equals(300));
    });
    test('extension methods', () {
      expect('522642'.addComma, equals('522,642'));
      expect('56,555.978'.removeComma, equals(56555.978));
    });
  });
}
