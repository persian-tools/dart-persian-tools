import 'package:dart_persian_tools/dart_persian_tools.dart';
import 'package:test/test.dart';

void main() {
  group('test url_fix.dart', () {
    test('test http/s and ws/s urls', () {
      // test https url
      expect(
          urlFix(
              'https://fa.wikipedia.org/wiki/%D9%85%D8%AF%DB%8C%D8%A7%20%D9%88%DB%8C%DA%A9%DB%8C'),
          equals('https://fa.wikipedia.org/wiki/مدیا%20ویکی'));

      // test wss url
      expect(urlFix('wss://hostname.domain/?q=i am a wrong query'),
          equals('wss://hostname.domain/?q=i%20am%20a%20wrong%20query'));

      // test http url
      expect(
          urlFix(
              'http://hostname.domain/%D9%85%D9%82%D8%A7%D9%84%D9%87%20%DB%8C%20%D8%B3%D9%84%D8%A7%D9%85'),
          equals('http://hostname.domain/مقاله%20ی%20سلام'));

      // test ws url
      expect(
          urlFix(
              'ws://hostname.domain/%D9%85%D9%86%20%D9%88%D8%A8%20%D8%B3%D9%88%DA%A9%D8%AA%D9%85'),
          equals('ws://hostname.domain/من%20وب%20سوکتم'));
    });
    test('test plain text', () {
      expect(urlFix('hello i am not a url'), equals('hello i am not a url'));
      expect(urlFix('://i have colon and slash'),
          equals('://i have colon and slash'));
    });
  });
}
