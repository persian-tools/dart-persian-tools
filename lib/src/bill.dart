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
  List<int>.generate(8, (index) => index + 1),
  billTypesList,
);

/// Saves Iranian currencies to use it in our codes as ```List<String>```
final List<String> currency = ['toman', 'rial'];

/// The means to gathering information from barcode or id and payment id of a bill
class Bill {
  /// Barcode of the Bill
  final String? _barcode;

  /// Currency of amount payable
  final String _currency;

  /// Bill ID of the Bill
  final int? _billId;

  /// Payment ID of the Bill
  final int? _paymentId;

  /// The only constructor for [Bill]
  Bill({
    String? barcode,
    String currency = 'toman',
    int? billId,
    int? paymentId,
  })  : _barcode = barcode,
        _currency = currencies.singleWhere((c) => currency == c),
        _billId = billId,
        _paymentId = paymentId;

  /// Takes amount of the Bill from payment ID
  int get amount {
    if (_paymentId == null) {
      throw Exception('You can not use [amount] when [paymentId] is null');
    }
    final currency = _currency == 'rial' ? 1000 : 100;
    return _paymentId! ~/ 100000 * currency;
  }
}
