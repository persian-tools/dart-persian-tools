import 'package:dart_persian_tools/dart_persian_tools.dart';
import 'package:dart_persian_tools/src/core/phone_number/models.dart';
import 'package:test/test.dart';

void main() {
  group('test phone_number.dart', () {
    test('test phoneNumberValidator method', () {
      final number1 = phoneNumberDetail('09022002580');

      expect(number1?.base, 'کشوری');
      expect(number1?.operator, 'ایرانسل');
      expect(number1?.type, SimCardType.both);

      final number2 = phoneNumberDetail('09981000000');

      expect(number2?.base, 'کشوری');
      expect(number2?.operator, 'شاتل موبایل');
      expect(number2?.type, SimCardType.credit);

      final number3 = phoneNumberDetail('09300880440');

      expect(number3?.base, 'کشوری');
      expect(number3?.operator, 'ایرانسل');
      expect(number3?.type, SimCardType.both);

      expect(phoneNumberDetail('09022002580')?.provinces?.length ?? 0, 0);

      /// Should return null, because it's not an iranian phone number
      expect(phoneNumberDetail('09802002580'), null);
    });
    test('test phoneNumberValidator method', () {
      expect(phoneNumberValidator('09022002580'), true);
      expect(phoneNumberValidator('09122002580'), true);
      expect(phoneNumberValidator('09322002580'), true);
      expect(phoneNumberValidator('09192002580'), true);

      expect(phoneNumberValidator('+989022002580'), true);
      expect(phoneNumberValidator('09022002580'), true);
      expect(phoneNumberValidator('989022002580'), true);
      expect(phoneNumberValidator('00989022002580'), true);
      expect(phoneNumberValidator('9022002580'), true);

      expect(phoneNumberValidator('09802002580'), false);
    });

    test('test getPhonePrefix method', () {
      /// Should return the prefix
      expect(getPhonePrefix('09022002580'), '902');
      expect(getPhonePrefix('09122002580'), '912');
      expect(getPhonePrefix('09981000000'), '998');
      expect(getPhonePrefix('09123200007'), '912');
      expect(getPhonePrefix('09300880440'), '930');

      /// Should return the prefix with 98 or +98
      expect(getPhonePrefix('+989022002580'), '902');
      expect(getPhonePrefix('989122002580'), '912');

      /// Should return nothing
      expect(getPhonePrefix('000989022002580'), '');
    });
  });
}
