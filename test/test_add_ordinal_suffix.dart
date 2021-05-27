import 'package:persian_tools/persian_tools.dart';
import 'package:test/test.dart';

void main() {
  group('test add_ordinal_suffix.dart', () {
    test('test addOrdinalSuffix method', () {
      expect(addOrdinalSuffix('چهل و سه'), equals('چهل و سوم'));
      expect(addOrdinalSuffix('پنجاه و پنج'), equals('پنجاه و پنجم'));
      expect(addOrdinalSuffix('صد و یک'), equals('صد و یکم'));
      expect(addOrdinalSuffix('سی'), equals('سی اُم'));
    });
    test('test AddOrdinalSuffix extension method', () {
      expect('چهل و یک'.withOrdinalSuffix, equals('چهل و یکم'));
      expect('شصت'.withOrdinalSuffix, equals('شصتم'));
      expect('سی'.withOrdinalSuffix, equals('سی اُم'));
      expect('هزار و صد و بیست و سه'.withOrdinalSuffix,
          equals('هزار و صد و بیست و سوم'));
    });
  });
}
