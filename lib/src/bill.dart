/// Saves bill types to use it in our codes as ```List<String>```
final List<String> billTypesList = [
  'آب',
  'برق',
  'گاز',
  'تلفن ثابت',
  'تلفن همراه',
  'عوارض شهرداری',
  'سازمان مالیات',
  'جرایم راهنمایی و رانندگی',
];

/// Saves bill types as a ```Map<int, String>```
final Map<int, String> billTypesMap = Map.fromIterables(
  List<int>.generate(9, (index) => index + 1),
  billTypesList,
);

/// Saves Iranian currencies to use it in our codes as ```List<String>```
final List<String> currency = ['toman', 'rial'];
