import 'package:persian_tools/persian_tools.dart';
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
    test('test convertEnToAr method', () {
      expect(convertEnToAr('123456'),"۱۲۳٤٥٦");
      expect(convertEnToAr('1234567891'),"۱۲۳٤٥٦۷۸۹۱");
      expect(convertEnToAr('0'),"۰");
      expect(convertEnToAr("123٤٥٦"),"۱۲۳٤٥٦");
      expect(convertEnToAr(""),"");

    });
    test('test convertFaToEn method', () {
      // just digits
      expect(convertFaToEn('۱۲۳456۷۸۹'), equals('123456789'));

      // digits in english with english text
      expect(
        convertFaToEn('i have some numbers : ۱۰۰۲۵'),
        equals('i have some numbers : 10025'),
      );

      // digits in english and persian with persian text
      expect(
        convertFaToEn('سلام این هارو اینگلیسی کن : 22۲۳۴'),
        equals('سلام این هارو اینگلیسی کن : 22234'),
      );

      // digits in arabic with mixed english and persian text
      expect(
        convertFaToEn('این ها digit های عربی است : ٤٥٦'),
        equals('این ها digit های عربی است : ٤٥٦'),
      );
    });
    test('test convertArToFa method', () {
      // digits in arabic , persian , english with arabic text
      expect(
        convertArToFa('السلام علیکم 14۱۲۳6٤٥'),
        equals('السلام علیکم 14۱۲۳6۴۵'),
      );

      // digits in arabic with english text
      expect(
        convertArToFa('hey! i have arabic : ۰۱۲۳٤٥٦۷۸۹'),
        equals('hey! i have arabic : ۰۱۲۳۴۵۶۷۸۹'),
      );

      // digits in arabic , english with persian text
      expect(
        convertArToFa('سلام به دوستای پرشین تولز : ٤٥٦۷123'),
        equals('سلام به دوستای پرشین تولز : ۴۵۶۷123'),
      );
    });
    test('test convertArToEn method', () {
      // digits in arabic and english with english text
      expect(
        convertArToEn('hello Persian Tools : 123٥٦۷'),
        equals('hello Persian Tools : 123567'),
      );

      // digits in arabic with english text
      expect(
        convertArToEn('hey! i have arabic : ۰۱۲۳٤٥٦۷۸۹'),
        equals('hey! i have arabic : 0123456789'),
      );

      // digits in arabic , english with persian text
      expect(
        convertArToEn('سلام به دوستای پرشین تولز : ٤٥٦۷123'),
        equals('سلام به دوستای پرشین تولز : 4567123'),
      );
    });
  });
}
