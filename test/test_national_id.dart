import 'package:persian_tools/persian_tools.dart';
import 'package:test/test.dart';

void main() {
  group('test national_id.dart', () {
    test('test input validation', () {
      /// empty string
      expect(''.isIranianNationalId, false);

      /// non 10 chars string - national id should contain 10 chars
      expect('00000'.isIranianNationalId, false);
    });

    test('test national ID validation', () {
      expect('1111111111'.isIranianNationalId, true);
      expect('0499370899'.isIranianNationalId, true);
      expect('0790419904'.isIranianNationalId, true);
      expect('0084575948'.isIranianNationalId, true);
      expect('0963695398'.isIranianNationalId, true);
      expect('0684159414'.isIranianNationalId, true);
      expect('0067749828'.isIranianNationalId, true);
      expect('0650451252'.isIranianNationalId, true);
      expect('1583250689'.isIranianNationalId, true);
      expect('4032152314'.isIranianNationalId, true);
      expect('0076229645'.isIranianNationalId, true);
      expect('4271467685'.isIranianNationalId, true);
      expect('0200203241'.isIranianNationalId, true);
      expect('0684159415'.isIranianNationalId, false);
    });
  });
}
