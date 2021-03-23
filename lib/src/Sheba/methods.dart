import './constants.dart';

/// Takes Sheba code and gives information from it
class Sheba {
  final String _shebaCode;

  /// [RegExp] to checking validation of the sheba
  final pattern = RegExp(r'IR[0-9]{24}');

  /// [RegExp] to finding bank code
  final patternCode = RegExp(r'IR[0-9]{2}([0-9]{3})[0-9]{19}');

  Sheba(this._shebaCode);

  // TODO:adding documentation
  int _iso7064Mod97_10(String iban) {
    String remainder = iban, block;
    while (remainder.length > 2) {
      // like slice in TS
      try {
        block = remainder.substring(0, 9);
      } on RangeError catch (e) {
        block = remainder;
      }
      remainder =
          '${int.parse(block) % 97}' + remainder.substring(block.length);
    }
    return int.parse(remainder) % 97;
  }

  /// Checks validation of the sheba
  bool get isValid {
    final shebaCode = _shebaCode;
    if (shebaCode.length != 26) return false;
    if (!pattern.hasMatch(shebaCode)) return false;
    final d1 = shebaCode.codeUnitAt(0) - 65 + 10;
    final d2 = shebaCode.codeUnitAt(1) - 65 + 10;
    var iban = shebaCode.substring(4);
    iban += '$d1$d2${shebaCode.substring(2, 4)}';
    final remainder = _iso7064Mod97_10(iban);
    return remainder != 1 ? false : true;
  }

  /// Returns all information from sheba code
  Map<String, dynamic>? call() {
    final shebaCode = _shebaCode;
    if (!isValid) return null;
    final bankCode = patternCode.firstMatch(shebaCode)?[1] ?? '';
    var bank = banksInfo[bankCode];
    if (bank == null) return null;
    if (bank['accountNumberAvailable']) {
      final data = bank['process'](shebaCode);
      bank['accountNumber'] = data['normal'];
      bank['formattedAccountNumber'] = data['formatted'];
    }
    bank.remove('process');
    return bank;
  }
}
