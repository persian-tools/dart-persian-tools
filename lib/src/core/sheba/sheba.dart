import 'package:persian_tools/src/constants/sheba/constants.dart';
import 'package:persian_tools/src/core/sheba/model.dart';

/// Takes Sheba code and gives information from it
class Sheba {
  final String _shebaCode;

  /// [RegExp] to checking validation of the sheba
  final pattern = RegExp(shebaRegExp);

  /// [RegExp] to finding bank code
  final patternCode = RegExp(bankCodeRegExp);

  Sheba(this._shebaCode);

  // TODO:adding documentation
  int _iso7064Mod97_10(String iban) {
    String remainder = iban, block;
    while (remainder.length > 2) {
      // like slice in TS
      try {
        block = remainder.substring(0, 9);
      } on RangeError catch (_) {
        block = remainder;
      }
      remainder = '${int.parse(block) % 97}' + remainder.substring(block.length);
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
  BankInformation? call() {
    final shebaCode = _shebaCode;
    if (!isValid) return null;
    final bankCode = patternCode.firstMatch(shebaCode)?[1] ?? '';
    var bank = banksInfo[bankCode];
    if (bank == null) return null;
    if (bank.isAccountNumberAvailable) {
      final data = bank.process!(shebaCode);
      bank.accountNumber = data.accountNumber;
      bank.formattedAccountNumber = data.formattedAccountNumber;
    }
    bank.process = null;
    return bank;
  }
}
