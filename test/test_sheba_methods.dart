import 'package:dart_persian_tools/dart_persian_tools.dart';
import 'package:test/test.dart';

void main() {
  group('test Sheba/methods.dart', () {
    test('test isValid getter', () {
      expect(Sheba('IR820540102680020817909002').isValid, equals(true));
      expect(Sheba('IR012345678901234567890123456789').isValid, equals(false));
      expect(Sheba('IR012345678901234567890123').isValid, equals(false));
      expect(Sheba('IR01234567890123456789').isValid, equals(false));
    });
    test('test call methods', () {
      var sheba = Sheba('IR820540102680020817909002');
      expect(
          sheba(),
          equals({
            'nickname': 'parsian',
            'name': 'Parsian Bank',
            'persianName': 'بانک پارسیان',
            'code': '054',
            'accountNumberAvailable': true,
            'accountNumber': '020817909002',
            'formattedAccountNumber': '0020-0081790-002',
          }));

    });
  });
}
