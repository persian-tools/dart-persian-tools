import 'package:persian_tools/persian_tools.dart';
import 'package:test/test.dart';

void main() {
  group('test remove_ordinal_suffix.dart', () {
    test('test isValid getter', () {
      expect(removeOrdinalSuffix('چهل و سوم'), equals('چهل و سه'));
      expect(removeOrdinalSuffix('چهل و پنجم'), equals('چهل و پنج'));
      expect(removeOrdinalSuffix('سی اُم'), equals('سی'));
      expect(removeOrdinalSuffix(''), '');
    });
  });
}
