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
final List<String> currencies = ['toman', 'rial'];

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
    final currency = _currency == 'rial' ? 1000 : 100;
    return _paymentId! ~/ 100000 * currency;
  }

  /// Takes bill type of the Bill form bill ID
  String get billType {
    var billIdStr = '$_billId';
    var billTypeKey = int.parse(
        billIdStr.substring(billIdStr.length - 2, billIdStr.length - 1));
    return billTypesMap[billTypeKey] ?? 'unknown';
  }

  /// Creates barcode of the Bill from bill ID and payment ID
  String get barcode {
    // ignore: unnecessary_brace_in_string_interps
    return '${_billId}000${_paymentId}';
  }

  /// Validates payment ID of the bill
  bool get isPaymentIdValid {
    var billIdSrt = '$_billId';
    var paymentIdStr = '$_paymentId';
    if (paymentIdStr.length < 6) return false;
    final firstControlBit = paymentIdStr[paymentIdStr.length - 2];
    final secondControlBit = paymentIdStr[paymentIdStr.length - 1];
    paymentIdStr = paymentIdStr.substring(0, paymentIdStr.length - 2);
    return _calTheBit(paymentIdStr) == int.parse(firstControlBit) &&
        _calTheBit(billIdSrt + paymentIdStr + firstControlBit) ==
            int.parse(secondControlBit);
  }

  /// Validates bill ID of the Bill
  bool get isBillIdValid {
    var billIdStr = '$_billId';
    if (billIdStr.length < 6) return false;
    final firstControlBit = billIdStr[billIdStr.length - 1];
    billIdStr = billIdStr.substring(0, billIdStr.length - 1);
    return _calTheBit(billIdStr) == int.parse(firstControlBit) &&
        billType != 'unknown';
  }

  /// Validates the Bill by bill ID and payment ID
  bool get isBillValid => isBillIdValid && isPaymentIdValid;

  /// Finds bill ID and payment ID from the given barcode or barcode class member
  /// which it returns ```List<int>``` - first one is bill ID , second one is payment ID
  List<int> findByBarcode([String? barcode]) {
    final nonNullBarcode = barcode ?? _barcode!;
    return [
      int.parse(nonNullBarcode.substring(0, 13)),
      int.parse(nonNullBarcode.substring(16)),
    ];
  }

  // TODO:documentation
  int _calTheBit(String number) {
    var sum = 0;
    var base = 2;
    for (var i = 0; i < number.length; ++i) {
      if (base == 8) base = 2;
      var substring = number.substring(
        number.length - 1 - i,
        number.length - i,
      );
      sum += int.parse(substring) * base;
      base++;
    }
    sum %= 11;
    if (sum < 2) {
      sum = 0;
    } else {
      sum = 11 - sum;
    }
    return sum;
  }
}
