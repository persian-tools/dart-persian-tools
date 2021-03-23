import './constants.dart';

/// Takes Sheba code and gives information from it
class Sheba {
  final String _shebaCode;
  final pattern = RegExp(r'IR[0-9]{24}');
  final pattern_code = RegExp(r'IR[0-9]{2}([0-9]{3})[0-9]{19}');

  Sheba(this._shebaCode);

  int _iso7064Mod97_10(String iban) {
    String remainder = iban, block;
    while (remainder.length > 2) {
      block = remainder.substring(0, 9);
      remainder =
          '${int.parse(block) % 97}' + remainder.substring(block.length);
    }
    return int.parse(remainder) % 97;
  }
}
