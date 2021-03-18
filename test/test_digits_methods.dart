import 'package:dart_persian_tools/dart_persian_tools.dart';
import 'package:test/test.dart';

void main() {
  group('test Digits/methods.dart', () {
    test('test convertEnToFa method', () {
      // just digits
      expect(convertEnToFa('۱۲۳456۷۸۹'), equals('۱۲۳۴۵۶۷۸۹'));

      // digits in english with english text
      expect(
        convertEnToFa('i have some numbers : 10025'),
        equals('i have some numbers : ۱۰۰۲۵'),
      );

      // digits in english and persian with persian text
      expect(
        convertEnToFa('سلام این هارو فارسی کن : 22۲۳۴'),
        equals('سلام این هارو فارسی کن : ۲۲۲۳۴'),
      );

      // digits in arabic with mixed english and persian text
      expect(
        convertEnToFa('این ها digit های عربی است : ٤٥٦'),
        equals('این ها digit های عربی است : ٤٥٦'),
      );
    });
  });
}
