import 'package:persian_tools/persian_tools.dart';
import 'package:persian_tools/src/core/sheba/model.dart';
import 'package:test/test.dart';

void main() {
  group('test sheba.dart', () {
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
          equals(
            BankInformation(
                nickname: 'parsian',
                name: 'Parsian Bank',
                persianName: 'بانک پارسیان',
                code: '054',
                isAccountNumberAvailable: true,
                accountNumber: '020817909002',
                formattedAccountNumber: '0020-0081790-002'),
          ));
    });
  });
}
