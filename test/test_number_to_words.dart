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
        numberToWordsByString('2,465,337,400', ordinal: true),
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
        numberToWordsByString('-700,443,000', ordinal: true),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزارم'),
      );

      expect(
        numberToWordsByString('-700443000', ordinal: true),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزارم'),
      );

      expect(
        numberToWordsByString('700443001', ordinal: true),
        equals('هفتصد میلیون و چهارصد و چهل و سه هزار و یکم'),
      );
    });

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
        numberToWordsByInt(2465337400, ordinal: true),
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
        numberToWordsByInt(-30, ordinal: true),
        equals('منفی سی اُم'),
      );

      expect(
        numberToWordsByInt(33, ordinal: true),
        equals('سی و سوم'),
      );

      expect(
        numberToWordsByInt(-700443000, ordinal: true),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزارم'),
      );

      expect(
        numberToWordsByInt(700443001, ordinal: true),
        equals('هفتصد میلیون و چهارصد و چهل و سه هزار و یکم'),
      );
    });

  });
}
