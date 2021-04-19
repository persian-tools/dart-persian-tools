import 'package:dart_persian_tools/dart_persian_tools.dart';
import 'package:test/test.dart';

void main() {
  group('test get_bank_name_from_card_number.dart', () {
    test('test getBankNameFromCardNumber method', () {
      expect(getBankNameFromCardNumber('6037701689095443')?.name, 'بانک کشاورزی');
      expect(getBankNameFromCardNumber('6219861034529007')?.name, 'بانک سامان');
      expect(getBankNameFromCardNumber('6219861034529007')?.name, 'بانک سامان');

      expect(getBankNameFromCardNumber('621986103452900'), null);
      expect(getBankNameFromCardNumber('9999991034529007'), null);
      expect(getBankNameFromCardNumber(''), null);
    });
  });
}
