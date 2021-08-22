import 'package:persian_tools/src/core/number_to_words/number_to_words.dart';
import 'package:test/test.dart';

void main() {
  group('test number_to_words.dart', () {
    test('test numberToWordsByString function: empty value', () {
      expect(
        numberToWords(150000000000000000),
        equals(
            'PersianTools: numberToWords - the number must be a safe integer less than 16 digits'),
      );
      expect(
        numberToWords(000),
        equals('صفر'),
      );
    });

    //----------------------------------------------------------------------------------------

    test('test numberToWordsByInt function', () {
      expect(
        numberToWords(0),
        equals('صفر'),
      );

      expect(
        numberToWords(4),
        equals('چهار'),
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
        numberToWords(500443),
        equals('پانصد هزار و چهارصد و چهل و سه'),
      );

      expect(
        numberToWords(2465337400, ordinal: true),
        equals(
            'دو میلیارد و چهارصد و شصت و پنج میلیون و سیصد و سی و هفت هزار و چهارصدم'),
      );

      expect(
        numberToWords(500).length,
        equals(5),
      );

      expect(
        numberToWords(502375902532527),
        equals(
            'پانصد و دو تریلیون و سیصد و هفتاد و پنج میلیارد و نهصد و دو میلیون و پانصد و سی و دو هزار و پانصد و بیست و هفت'),
      );

      expect(
        numberToWords(500),
        hasLength(5),
      );

      expect(
        numberToWords(30000000000),
        equals('سی میلیارد'),
      );

      expect(
        numberToWords(987654321),
        equals(
            'نهصد و هشتاد و هفت میلیون و ششصد و پنجاه و چهار هزار و سیصد و بیست و یک'),
      );

      expect(
        numberToWords(9006199254740992),
        equals(
            'نه کوآدریلیون و شش تریلیون و صد و نود و نه میلیارد و دویست و پنجاه و چهار میلیون و هفتصد و چهل هزار و نهصد و نود و دو'),
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
        numberToWords(-123, ordinal: true),
        equals('منفی صد و بیست و سوم'),
      );

      expect(
        numberToWords(33, ordinal: true),
        equals('سی و سوم'),
      );

      expect(
        numberToWords(45, ordinal: true),
        equals('چهل و پنجم'),
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

      expect(int.convertNumToWords(), equals('منفی سی'));

      expect(
        (-700443000).convertNumToWords(),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزار'),
      );
      expect(
        (-700443000).convertNumToWords(ordinal: true),
        equals('منفی هفتصد میلیون و چهارصد و چهل و سه هزارم'),
      );

      expect(
        int.convertNumToWords(ordinal: true),
        equals('منفی سی اُم'),
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
        (-87).convertNumToWords(),
        equals('منفی هشتاد و هفت'),
      );
      expect(
        (-87).convertNumToWords(ordinal: true),
        equals('منفی هشتاد و هفتم'),
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
        500.convertNumToWords().length,
        equals(5),
      );

      expect(
        0.convertNumToWords(),
        equals('صفر'),
      );
    });
  });
}
