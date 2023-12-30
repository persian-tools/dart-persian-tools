import 'package:persian_tools/persian_tools.dart';
import 'package:persian_tools/src/core/phone_number/models.dart';
import 'package:test/test.dart';

void main() {
  group('test phone_number.dart', () {
    test('test phoneNumberValidator method', () {
      final number1 = getPhoneNumberDetail('09022002580');

      expect(number1?.base, 'کشوری');
      expect(number1?.operator?.name, 'ایرانسل');
      expect(number1?.type, SimCardType.both);

      final number2 = getPhoneNumberDetail('09981000000');

      expect(number2?.base, 'کشوری');
      expect(number2?.operator?.name, 'شاتل موبایل');
      expect(number2?.type, SimCardType.credit);

      final number3 = getPhoneNumberDetail('09300880440');

      expect(number3?.base, 'کشوری');
      expect(number3?.operator?.name, 'ایرانسل');
      expect(number3?.type, SimCardType.both);

      final number4 = getPhoneNumberDetail('09960880440');

      expect(number4?.base, 'کشوری');
      expect(number4?.operator?.name, 'همراه اول');
      expect(number4?.type, SimCardType.credit);

      final number5 = getPhoneNumberDetail('09000880440');

      expect(number5?.base, 'کشوری');
      expect(number5?.operator?.name, 'ایرانسل');
      expect(number5?.type, SimCardType.both);

      final number6 = getPhoneNumberDetail('09990880440');

      expect(number6?.base, 'کشوری');
      expect(number6?.operator?.name, 'سامانتل');
      expect(number6?.type, SimCardType.both);

      expect(getPhoneNumberDetail('09022002580')?.provinces?.length ?? 0, 0);

      /// Should return null, because it's not an iranian phone number
      expect(getPhoneNumberDetail('09802002580'), null);
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

      expect(phoneNumberValidator('9992002580'), true);
      expect(phoneNumberValidator('00989992002580'), true);
      expect(phoneNumberValidator('+989992002580'), true);

      expect(phoneNumberValidator('09802002580'), false);
    });

    test('test getPhonePrefix method', () {
      /// Should return the prefix
      expect(getPhonePrefix('09022002580'), '902');
      expect(getPhonePrefix('09122002580'), '912');
      expect(getPhonePrefix('09981000000'), '998');
      expect(getPhonePrefix('09123200007'), '912');
      expect(getPhonePrefix('09300880440'), '930');

      expect(getPhonePrefix('09990880440'), '999');

      /// Should return the prefix with 98 or +98
      expect(getPhonePrefix('+989022002580'), '902');
      expect(getPhonePrefix('989122002580'), '912');

      /// Should return nothing
      expect(getPhonePrefix('000989022002580'), '');
    });
  });
}
