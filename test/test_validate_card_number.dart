import 'package:persian_tools/persian_tools.dart';
import 'package:test/test.dart';

void main() {
  group('test validate_card_number.dart', () {
    test('test validateCardNumber', () {
      expect(validateCardNumber('6037701689095443'), equals(true));
      expect(validateCardNumber('6219861034529007'), equals(true));
      expect(validateCardNumber('6219861034529008'), equals(false));
      expect(validateCardNumber('621986103452900'), equals(false));
      expect(validateCardNumber('0'), equals(false));
    });
  });
}
