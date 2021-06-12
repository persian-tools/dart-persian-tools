import 'package:persian_tools/src/constants/get_bank_name_from_card_number/constants.dart';
import 'package:persian_tools/src/core/get_bank_name_from_card_number/models.dart';

/// Checks the [cardNumber] is a valid bank card and returns the [Bank] info
/// if it isn't a valid card or not related to a bank it will returns null
Bank? getBankNameFromCardNumber(String cardNumber) {
  if (cardNumber.length == 16) {
    /// split the card number and cut the init code from it
    final initCode = cardNumber.substring(0, 6);

    final findBank = bankInformation.firstWhere(
      (element) => element?.initCode == initCode,
      orElse: () => null,
    );

    if (findBank != null) return findBank;
  }
  return null;
}

/// [String] Extension wrapper to getting bank name from String object
extension BankNameFromCardNumber on String {
  Bank? get bankNameFromCard => getBankNameFromCardNumber(this);
}
