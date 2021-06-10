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
        equals(
            'دو میلیارد و چهارصد و شصت و پنج میلیون و سیصد و سی و هفت هزار و چهارصد'),
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
        equals(
            'دو میلیارد و چهارصد و شصت و پنج میلیون و سیصد و سی و هفت هزار و چهارصدم'),
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
        numberToWords(0),
        equals('صفر'),
      );

      expect(
        numberToWords(56),
        equals('پنجاه و شش'),
      );

      expect(
        numberToWords(256432),
        equals('دویست و پنجاه و شش هزار و چهارصد و سی و دو'),
      );

      expect(
        numberToWords(2465337400),
        equals(
            'دو میلیارد و چهارصد و شصت و پنج میلیون و سیصد و سی و هفت هزار و چهارصد'),
      );

      expect(
        numberToWords(0),
        equals('صفر'),
      );

      expect(
        numberToWords(500443),
        equals('پانصد هزار و چهارصد و چهل و سه'),
      );

      expect(
        numberToWords(2465337400, ordinal: true),
        equals(
            'دو میلیارد و چهارصد و شصت و پنج میلیون و سیصد و سی و هفت هزار و چهارصدم'),
      );

      expect(
        numberToWords(500)?.length,
        equals(5),
      );

      expect(
        numberToWords(502375902532527),
        equals(''),
      );
    });

    test('test numberToWordsByInt function: with negative values', () {
      expect(
        numberToWords(-87),
        equals('منفی هشتاد و هفت'),
      );

      expect(
        numberToWords(-256432),
        equals('منفی دویست و پنجاه و شش هزار و چهارصد و سی و دو'),
      );

      expect(
        numberToWords(-500443),
        equals('منفی پانصد هزار و چهارصد و چهل و سه'),
      );

      expect(
        numberToWords(-700443000),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزار'),
      );
    });

    test('test numberToWordsByInt function: return ordinal words', () {
      expect(
        numberToWords(-30, ordinal: true),
        equals('منفی سی اُم'),
      );

      expect(
        numberToWords(33, ordinal: true),
        equals('سی و سوم'),
      );

      expect(
        numberToWords(-700443000, ordinal: true),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزارم'),
      );

      expect(
        numberToWords(700443001, ordinal: true),
        equals('هفتصد میلیون و چهارصد و چهل و سه هزار و یکم'),
      );
    });

    //----------------------------------------------------------------------------------------

    test('test numberToWords extension', () {
      var int = -30;
      var str = '555';

      expect(int.convertNumToWords()!, equals('منفی سی'));
      expect(str.convertNumToWords()!, equals('پانصد و پنجاه و پنج'));

      expect(
        '-700443000'.convertNumToWords(),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزار'),
      );
      expect(
        '-700443000'.convertNumToWords(ordinal: true),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزارم'),
      );

      expect(
        (-700443000).convertNumToWords(),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزار'),
      );
      expect(
        (-700443000).convertNumToWords(ordinal: true),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزارم'),
      );

      expect(
        500443.convertNumToWords(),
        equals('پانصد هزار و چهارصد و چهل و سه'),
      );
      expect(
        500443.convertNumToWords(ordinal: true),
        equals('پانصد هزار و چهارصد و چهل و سوم'),
      );

      expect(
        '-700,443,000'.convertNumToWords(),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزار'),
      );
      expect(
        '-700,443,000'.convertNumToWords(ordinal: true),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزارم'),
      );

      expect(
        '-87'.convertNumToWords(),
        equals('منفی هشتاد و هفت'),
      );
      expect(
        '-87'.convertNumToWords(ordinal: true),
        equals('منفی هشتاد و هفتم'),
      );

      expect(
        '87'.convertNumToWords(),
        equals('هشتاد و هفت'),
      );
      expect(
        '87'.convertNumToWords(ordinal: true),
        equals('هشتاد و هفتم'),
      );

      expect(
        87.convertNumToWords(),
        equals('هشتاد و هفت'),
      );
      expect(
        87.convertNumToWords(ordinal: true),
        equals('هشتاد و هفتم'),
      );

      expect(
        500.convertNumToWords()?.length,
        equals(5),
      );
      expect(
        '500'.convertNumToWords()?.length,
        equals(5),
      );

      expect(
        0.convertNumToWords(),
        equals('صفر'),
      );
      expect(
        '0'.convertNumToWords(),
        equals('صفر'),
      );
    });
  });
}
