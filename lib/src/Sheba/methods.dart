import './constants.dart';

/// Takes Sheba code and gives information from it
class Sheba {
  final String _shebaCode;
  final pattern = RegExp(r'IR[0-9]{24}');
  final pattern_code = RegExp(r'IR[0-9]{2}([0-9]{3})[0-9]{19}');

  Sheba(this._shebaCode);

}
