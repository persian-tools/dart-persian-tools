import 'package:dart_persian_tools/dart_persian_tools.dart';

void main() {
  print(isPersian('این یک متن فارسی است؟')); // true
  print(isPersian('هل هذا نص فارسي؟')); // false
  print(hasPersian('This text includes فارسی')); // true
  print(hasPersian('Это персидский س текст?')); // true
  print(hasPersian('أكد رئيس اللجنة العسكرية الممثلة لحكومة الوفاق أراضي البلاد.')); //true
}
