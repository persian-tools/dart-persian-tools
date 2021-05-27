import 'package:persian_tools/persian_tools.dart';
import 'package:test/test.dart';

void main() {
  group('test words_to_number/words_to_number.dart', () {
    test('test wordsToNumber function', () {
      expect(wordsToNumber('منفی سه هزار'), -3000);
      expect(wordsToNumber('سه هزار دویست و دوازده'), 3212);
      expect(wordsToNumber('دوازده هزار بیست دو'), 12022);
      expect(
        wordsToNumberString('دوازده هزار بیست دو', addComma: true),
        '12,022',
      );
      expect(
        wordsToNumberString('دوازده هزار و بیست و دو', addComma: true),
        '12,022',
      );
    });
    test('test wordsToNumber function: arabic digits', () {
      expect(
        wordsToNumberString('منفی سه هزار', digits: DigitLocale.ar),
        '-۳۰۰۰',
      );
      expect(
        wordsToNumberString(
          'سه هزار دویست و دوازده',
          digits: DigitLocale.ar,
        ),
        '۳۲۱۲',
      );
      expect(
        wordsToNumberString(
          'دوازده هزار بیست دو',
          digits: DigitLocale.ar,
        ),
        '۱۲۰۲۲',
      );
      expect(
        wordsToNumberString(
          'دوازده هزار بیست دو',
          digits: DigitLocale.ar,
          addComma: true,
        ),
        '۱۲,۰۲۲',
      );
      expect(
        wordsToNumberString(
          'دوازده هزار و بیست و دو',
          digits: DigitLocale.ar,
          addComma: true,
        ),
        '۱۲,۰۲۲',
      );
      expect(
        wordsToNumberString(
          'چهارصد پنجاه هزار',
          digits: DigitLocale.ar,
          addComma: true,
        ),
        '٤٥۰,۰۰۰',
      );
      expect(
        wordsToNumberString(
          'چهارصد پنجاه هزار',
          digits: DigitLocale.ar,
        ),
        '٤٥۰۰۰۰',
      );
    });
    test('test wordsToNumber function: with ordinal words', () {
      expect(
        wordsToNumberString(
          'منفی ۳ هزار',
          digits: DigitLocale.fa,
          addComma: true,
        ),
        '-۳,۰۰۰',
      );
      expect(
        wordsToNumberString(
          'منفی 3 هزار و 200',
          digits: DigitLocale.fa,
          addComma: true,
        ),
        '-۳,۲۰۰',
      );
      expect(
        wordsToNumberString(
          'منفی سه هزارمین',
          digits: DigitLocale.fa,
          addComma: true,
        ),
        '-۳,۰۰۰',
      );
      expect(
        wordsToNumberString('منفی سه هزارمین', digits: DigitLocale.fa),
        '-۳۰۰۰',
      );
      expect(wordsToNumber('منفی سه هزارمین'), -3000);
      expect(wordsToNumber('منفی سه هزارم'), -3000);
      expect(wordsToNumberString('منفی سه هزارمین'), isNot(equals('-3000')));
      expect(wordsToNumberString('منفی سه هزارمین').length, 5);
      expect(wordsToNumber('منفی سی اُم'), -30);
      expect(wordsToNumber('سی و سوم'), 33);
    });
    test('test wordsToNumber function: empty value', () {
      expect(
        wordsToNumberString('', digits: DigitLocale.fa).addComma,
        equals(''),
      );
    });
  });
}
