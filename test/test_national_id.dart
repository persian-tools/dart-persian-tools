import 'package:dart_persian_tools/dart_persian_tools.dart';
import 'package:test/test.dart';

void main() {
  group('test national_id.dart', () {
    test('test input validation', () {
      /// empty string
      expect(
        ''.verifyIranianNationalId,
        false,
      );

      /// non 10 chars string - national id should contain 10 chars
      expect(
        '00000'.verifyIranianNationalId,
        false,
      );
    });
    test('test national ID validation', () {
      expect('0499370899'.verifyIranianNationalId, true);
      expect('1111111111'.verifyIranianNationalId, true);
      expect('0790419904'.verifyIranianNationalId, true);
      expect('0084575948'.verifyIranianNationalId, true);
      expect('0963695398'.verifyIranianNationalId, true);
      expect('0684159414'.verifyIranianNationalId, true);
      expect('0067749828'.verifyIranianNationalId, true);
      expect('0650451252'.verifyIranianNationalId, true);
      expect('1583250689'.verifyIranianNationalId, true);
      expect('4032152314'.verifyIranianNationalId, true);
      expect('0076229645'.verifyIranianNationalId, true);
      expect('4271467685'.verifyIranianNationalId, true);
      expect('0200203241'.verifyIranianNationalId, true);
      expect('0684159415'.verifyIranianNationalId, false);
    });
  });
}
