
import 'package:persian_tools/src/core/jalali/jalali.dart';
import 'package:test/test.dart';

void main() {
  group('test jalali.dart', () {

    test('return curent time', () {
      // first bill
      expect(
        Jalali().now(),
        equals('1400-18-11 05:11:24 450'),
      );
    });

    test('jalali to ago', () {
      // first bill
      expect(
        Jalali().now().toString().jalaliToAgo(),
        equals('لحضاتی قبل'),
      );
    });

    test('time stamp to ago', () {
      // first bill
      expect(
        '1630151993'.timeStampToAgo(),
        equals('42 دقیقه قبل'),
      );
    });

    test('jalai to gregorian', () {
      // first bill
      expect(
        Jalali().now().toGregorian(),
        equals('2021-08-28 17:11:24.098819'),
      );
    });

    test('gregorian to ago', () {
      // first bill
      expect(
        Jalali().now().toGregorian().toString().deteTimeToAgo(),
        equals('لحضاتی قبل'),
      );
    });

 
    test('jalali to time stamp', () {
      // first bill
      expect(
        Jalali().now().jalaliToTimeStamp(),
        equals('لحضاتی قبل'),
      );
    });

    test('timestamp to jalai', () {
      // first bill
      expect(
        '1630151993'.timeStampToJalai(),
        equals('1400-18-11 04:29:53'),
      );
    });

  });
}