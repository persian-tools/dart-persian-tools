import 'package:dart_persian_tools/dart_persian_tools.dart';
import 'package:test/test.dart';

void main() {
  group('test isPersian/methods.dart', () {
    test('test isPersian method', () {
      expect(isPersian('این یک متن فارسی است؟'), equals(true));
      expect(
        isPersian(
            'آیا سیستم میتواند گزینه های دیگری را به اشتباه به عنوان متن فارسی تشخیص دهد؟'),
        equals(true),
      );
      expect(isPersian('Lorem Ipsum Test'), equals(false));
      expect(isPersian('これはペルシア語のテキストですか'), equals(false));
      expect(isPersian('Это персидский текст?'), equals(false));
      expect(isPersian('这是波斯文字吗?'), equals(false));
      expect(isPersian('هل هذا نص فارسي؟'), equals(false));
      expect(
        isPersian(
            'أكد رئيس اللجنة العسكرية الممثلة لحكومة الوفاق الوطني في ليبيا أحمد علي أبو شحمة، أن اللجنة لا تستطيع تنفيذ خطتها لإخراج العناصر الأجنبية من أراضي البلاد.'),
        equals(false),
      );
      expect(isPersian(''), equals(false));
    });

    test('test hasPersian method', () {
      expect(hasPersian('این یک متن فارسی است؟'), equals(true));
      expect(hasPersian('هل هذا نص فارسي؟'), equals(true));
      expect(
        hasPersian(
            'آیا سیستم میتواند گزینه های دیگری را به اشتباه به عنوان متن فارسی تشخیص دهد؟'),
        equals(true),
      );
      expect(hasPersian('This text includes فارسی'), equals(true));
      expect(hasPersian('Это персидский س текст?'), equals(true));
      expect(
        hasPersian(
            'أكد رئيس اللجنة العسكرية الممثلة لحكومة الوفاق أراضي البلاد.'),
        equals(true),
      );

      expect(hasPersian('Lorem Ipsum Test'), equals(false));
      expect(hasPersian('これはペルシア語のテキストですか'), equals(false));
      expect(hasPersian('Это персидский текст?'), equals(false));
      expect(hasPersian('这是波斯文字吗?'), equals(false));
      expect(hasPersian(''), equals(false));
    });
    ;
  });
}
