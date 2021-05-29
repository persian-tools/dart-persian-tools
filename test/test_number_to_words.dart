import 'package:persian_tools/src/core/number_to_words/number_to_words.dart';
import 'package:test/test.dart';

void main() {
  group('test number_to_words.dart', () {
    test('test numberToWordsByString function: empty value', () {

      expect(
        numberToWordsByString(''),
        null,
      );

    });

    test('test toWord method', () {

      expect(numToWord(432), equals('چهارصد و سی و دو'),);
      expect(numToWord(85), equals('هشتاد و پنج'),);

    });
    //----------------------------------------------------------------------------------------
    test('test numberToWordsByString function', () {
      expect(
        numberToWordsByString('56'),
        equals('پنجاه و شش'),
      );

      expect(
        numberToWordsByString('256432'),
        equals('دویست و پنجاه و شش هزار و چهارصد و سی و دو'),
      );

      expect(
        numberToWordsByString('2,465,337,400'),
        equals('دو میلیارد و چهارصد و شصت و پنج میلیون و سیصد و سی و هفت هزار و چهارصد'),
      );

      expect(
        numberToWordsByString('0'),
        equals('صفر'),
      );

      expect(
        numberToWordsByString('500,443'),
        equals('پانصد هزار و چهارصد و چهل و سه'),
      );

      expect(
        numberToWordsByString('2,465,337,400', true),
        equals('دو میلیارد و چهارصد و شصت و پنج میلیون و سیصد و سی و هفت هزار و چهارصدم'),
      );

      expect(
        numberToWordsByString('500')?.length,
        equals(5),
      );

      expect(
        numberToWordsByString('502375902532527'),
        equals(''),
      );

    });

    test('test numberToWordsByString function: with negative values', () {
      expect(
        numberToWordsByString('-87'),
        equals('منفی هشتاد و هفت'),
      );

      expect(
        numberToWordsByString('-256432'),
        equals('منفی دویست و پنجاه و شش هزار و چهارصد و سی و دو'),
      );

      expect(
        numberToWordsByString('-500,443'),
        equals('منفی پانصد هزار و چهارصد و چهل و سه'),
      );

      expect(
        numberToWordsByString('-700,443,000'),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزار'),
      );
    });

    test('test numberToWordsByString function: return ordinal words', () {
      expect(
        numberToWordsByString('-700,443,000', true),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزارم'),
      );

      expect(
        numberToWordsByString('-700443000', true),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزارم'),
      );

      expect(
        numberToWordsByString('700443001', true),
        equals('هفتصد میلیون و چهارصد و چهل و سه هزار و یکم'),
      );
    });
    //----------------------------------------------------------------------------------------
    test('test numberToWordsByInt function', () {
      expect(
        numberToWordsByInt(0),
        equals('صفر'),
      );

      expect(
        numberToWordsByInt(56),
        equals('پنجاه و شش'),
      );

      expect(
        numberToWordsByInt(256432),
        equals('دویست و پنجاه و شش هزار و چهارصد و سی و دو'),
      );

      expect(
        numberToWordsByInt(2465337400),
        equals('دو میلیارد و چهارصد و شصت و پنج میلیون و سیصد و سی و هفت هزار و چهارصد'),
      );

      expect(
        numberToWordsByInt(0),
        equals('صفر'),
      );

      expect(
        numberToWordsByInt(500443),
        equals('پانصد هزار و چهارصد و چهل و سه'),
      );

      expect(
        numberToWordsByInt(2465337400, true),
        equals('دو میلیارد و چهارصد و شصت و پنج میلیون و سیصد و سی و هفت هزار و چهارصدم'),
      );

      expect(
        numberToWordsByInt(500)?.length,
        equals(5),
      );

      expect(
        numberToWordsByInt(502375902532527),
        equals(''),
      );

    });

    test('test numberToWordsByInt function: with negative values', () {

      expect(
        numberToWordsByInt(-87),
        equals('منفی هشتاد و هفت'),
      );

      expect(
        numberToWordsByInt(-256432),
        equals('منفی دویست و پنجاه و شش هزار و چهارصد و سی و دو'),
      );

      expect(
        numberToWordsByInt(-500443),
        equals('منفی پانصد هزار و چهارصد و چهل و سه'),
      );

      expect(
        numberToWordsByInt(-700443000),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزار'),
      );
    });

    test('test numberToWordsByInt function: return ordinal words', () {

      expect(
        numberToWordsByInt(-30, true),
        equals('منفی سی اُم'),
      );

      expect(
        numberToWordsByInt(33, true),
        equals('سی و سوم'),
      );

      expect(
        numberToWordsByInt(-700443000, true),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزارم'),
      );

      expect(
        numberToWordsByInt(700443001, true),
        equals('هفتصد میلیون و چهارصد و چهل و سه هزار و یکم'),
      );
    });

    test('test numberToWords extension', () {

      expect('-700443000'.convertNumToWordsByStr(), equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزار'),);
      expect('-700443000'.convertNumToWordsByStr(true), equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزارم'),);

      expect((-700443000).convertNumToWordsByInt(), equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزار'),);
      expect((-700443000).convertNumToWordsByInt(true), equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزارم'),);

      expect(500443.convertNumToWordsByInt(), equals('پانصد هزار و چهارصد و چهل و سه'),);
      expect(500443.convertNumToWordsByInt(true), equals('پانصد هزار و چهارصد و چهل و سوم'),);

      expect('-700,443,000'.convertNumToWordsByStr(),equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزار'),);
      expect('-700,443,000'.convertNumToWordsByStr(true),equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزارم'),);

      expect('-87'.convertNumToWordsByStr(), equals('منفی هشتاد و هفت'),);
      expect('-87'.convertNumToWordsByStr(true), equals('منفی هشتاد و هفتم'),);

      expect('87'.convertNumToWordsByStr(), equals('هشتاد و هفت'),);
      expect('87'.convertNumToWordsByStr(true), equals('هشتاد و هفتم'),);

      expect(87.convertNumToWordsByInt(), equals('هشتاد و هفت'),);
      expect(87.convertNumToWordsByInt(true), equals('هشتاد و هفتم'),);

      expect(500.convertNumToWordsByInt()?.length, equals(5),);
      expect('500'.convertNumToWordsByStr()?.length, equals(5),);

      expect(0.convertNumToWordsByInt(), equals('صفر'),);
      expect('0'.convertNumToWordsByStr(), equals('صفر'),);

    });

  });
}
