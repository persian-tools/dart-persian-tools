import 'package:persian_tools/src/core/number_to_words/number_to_words.dart';
import 'package:test/test.dart';

void main() {
  group('test number_to_words.dart', () {
    test('test numberToWordsByString function: empty value', () {
      expect(
        numberToWordsString(''),
        null,
      );
    });

    test('test toWord method', () {
      expect(
        numToWord(432),
        equals('چهارصد و سی و دو'),
      );
      expect(
        numToWord(85),
        equals('هشتاد و پنج'),
      );
    });
    //----------------------------------------------------------------------------------------
    test('test numberToWordsByString function', () {
      expect(
        numberToWordsString('56'),
        equals('پنجاه و شش'),
      );

      expect(
        numberToWordsString('256432'),
        equals('دویست و پنجاه و شش هزار و چهارصد و سی و دو'),
      );

      expect(
        numberToWordsString('2,465,337,400'),
        equals('دو میلیارد و چهارصد و شصت و پنج میلیون و سیصد و سی و هفت هزار و چهارصد'),
      );

      expect(
        numberToWordsString('0'),
        equals('صفر'),
      );

      expect(
        numberToWordsString('500,443'),
        equals('پانصد هزار و چهارصد و چهل و سه'),
      );

      expect(
        numberToWordsString('2,465,337,400', ordinal: true),
        equals('دو میلیارد و چهارصد و شصت و پنج میلیون و سیصد و سی و هفت هزار و چهارصدم'),
      );

      expect(
        numberToWordsString('500')?.length,
        equals(5),
      );

      expect(
        numberToWordsString('502375902532527'),
        equals(''),
      );
    });

    test('test numberToWordsByString function: with negative values', () {
      expect(
        numberToWordsString('-87'),
        equals('منفی هشتاد و هفت'),
      );

      expect(
        numberToWordsString('-256432'),
        equals('منفی دویست و پنجاه و شش هزار و چهارصد و سی و دو'),
      );

      expect(
        numberToWordsString('-500,443'),
        equals('منفی پانصد هزار و چهارصد و چهل و سه'),
      );

      expect(
        numberToWordsString('-700,443,000'),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزار'),
      );
    });

    test('test numberToWordsByString function: return ordinal words', () {
      expect(
        numberToWordsString('-700,443,000', ordinal: true),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزارم'),
      );

      expect(
        numberToWordsString('-700443000', ordinal: true),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزارم'),
      );

      expect(
        numberToWordsString('700443001', ordinal: true),
        equals('هفتصد میلیون و چهارصد و چهل و سه هزار و یکم'),
      );
    });
    //----------------------------------------------------------------------------------------
    test('test numberToWordsByInt function', () {
      expect(
        numberToWordsInt(0),
        equals('صفر'),
      );

      expect(
        numberToWordsInt(56),
        equals('پنجاه و شش'),
      );

      expect(
        numberToWordsInt(256432),
        equals('دویست و پنجاه و شش هزار و چهارصد و سی و دو'),
      );

      expect(
        numberToWordsInt(2465337400),
        equals('دو میلیارد و چهارصد و شصت و پنج میلیون و سیصد و سی و هفت هزار و چهارصد'),
      );

      expect(
        numberToWordsInt(0),
        equals('صفر'),
      );

      expect(
        numberToWordsInt(500443),
        equals('پانصد هزار و چهارصد و چهل و سه'),
      );

      expect(
        numberToWordsInt(2465337400, ordinal: true),
        equals('دو میلیارد و چهارصد و شصت و پنج میلیون و سیصد و سی و هفت هزار و چهارصدم'),
      );

      expect(
        numberToWordsInt(500)?.length,
        equals(5),
      );

      expect(
        numberToWordsInt(502375902532527),
        equals(''),
      );
    });

    test('test numberToWordsByInt function: with negative values', () {
      expect(
        numberToWordsInt(-87),
        equals('منفی هشتاد و هفت'),
      );

      expect(
        numberToWordsInt(-256432),
        equals('منفی دویست و پنجاه و شش هزار و چهارصد و سی و دو'),
      );

      expect(
        numberToWordsInt(-500443),
        equals('منفی پانصد هزار و چهارصد و چهل و سه'),
      );

      expect(
        numberToWordsInt(-700443000),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزار'),
      );
    });

    test('test numberToWordsByInt function: return ordinal words', () {
      expect(
        numberToWordsInt(-30, ordinal: true),
        equals('منفی سی اُم'),
      );

      expect(
        numberToWordsInt(33, ordinal: true),
        equals('سی و سوم'),
      );

      expect(
        numberToWordsInt(-700443000, ordinal: true),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزارم'),
      );

      expect(
        numberToWordsInt(700443001, ordinal: true),
        equals('هفتصد میلیون و چهارصد و چهل و سه هزار و یکم'),
      );
    });

    test('test numberToWords extension', () {
      var int = -30;
      var str = '555';

      expect(int.convertNumToWordsInt()!, equals('منفی سی'));
      expect(str.convertNumToWordsString()!, equals('پانصد و پنجاه و پنج'));

      expect(
        '-700443000'.convertNumToWordsString(),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزار'),
      );
      expect(
        '-700443000'.convertNumToWordsString(ordinal: true),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزارم'),
      );

      expect(
        (-700443000).convertNumToWordsInt(),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزار'),
      );
      expect(
        (-700443000).convertNumToWordsInt(ordinal: true),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزارم'),
      );

      expect(
        500443.convertNumToWordsInt(),
        equals('پانصد هزار و چهارصد و چهل و سه'),
      );
      expect(
        500443.convertNumToWordsInt(ordinal: true),
        equals('پانصد هزار و چهارصد و چهل و سوم'),
      );

      expect(
        '-700,443,000'.convertNumToWordsString(),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزار'),
      );
      expect(
        '-700,443,000'.convertNumToWordsString(ordinal: true),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزارم'),
      );

      expect(
        '-87'.convertNumToWordsString(),
        equals('منفی هشتاد و هفت'),
      );
      expect(
        '-87'.convertNumToWordsString(ordinal: true),
        equals('منفی هشتاد و هفتم'),
      );

      expect(
        '87'.convertNumToWordsString(),
        equals('هشتاد و هفت'),
      );
      expect(
        '87'.convertNumToWordsString(ordinal: true),
        equals('هشتاد و هفتم'),
      );

      expect(
        87.convertNumToWordsInt(),
        equals('هشتاد و هفت'),
      );
      expect(
        87.convertNumToWordsInt(ordinal: true),
        equals('هشتاد و هفتم'),
      );

      expect(
        500.convertNumToWordsInt()?.length,
        equals(5),
      );
      expect(
        '500'.convertNumToWordsString()?.length,
        equals(5),
      );

      expect(
        0.convertNumToWordsInt(),
        equals('صفر'),
      );
      expect(
        '0'.convertNumToWordsString(),
        equals('صفر'),
      );
    });
  });
}
