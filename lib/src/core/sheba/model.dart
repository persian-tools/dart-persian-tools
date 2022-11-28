/// Stores account number that _*Proc methods returns
class AccountNumberModel {
  final String accountNumber, formattedAccountNumber;

  const AccountNumberModel({
    required this.accountNumber,
    required this.formattedAccountNumber,
  });
}

/// Stores Bank information that [banksInfo] uses
class BankInformation {
  final String nickname, name, persianName, code;
  final bool isAccountNumberAvailable;
  AccountNumberModel Function(String)? process;
  String? accountNumber, formattedAccountNumber;

  BankInformation({
    required this.nickname,
    required this.name,
    required this.persianName,
    required this.code,
    required this.isAccountNumberAvailable,
    this.process,
    this.accountNumber,
    this.formattedAccountNumber,
  });

  @override
  int get hashCode => Object.hash(
        nickname,
        name,
        [
          persianName,
          code,
          isAccountNumberAvailable,
          accountNumber,
          formattedAccountNumber,
          process,
        ],
      );

  @override
  bool operator ==(Object other) {
    other = other as BankInformation;
    return nickname == other.nickname &&
        name == other.name &&
        persianName == other.persianName &&
        code == other.code &&
        isAccountNumberAvailable == other.isAccountNumberAvailable &&
        accountNumber == other.accountNumber &&
        formattedAccountNumber == other.formattedAccountNumber &&
        process == other.process;
  }
}
