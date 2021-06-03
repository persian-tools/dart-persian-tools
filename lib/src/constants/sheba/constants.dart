import 'package:persian_tools/src/core/sheba/model.dart';

const shebaRegExp = r'IR[0-9]{24}';

const bankCodeRegExp = r'IR[0-9]{2}([0-9]{3})[0-9]{19}';

var _banksInfo = <BankInformation>[
  BankInformation(
      nickname: 'central-bank',
      name: 'Central Bank of Iran',
      persianName: 'بانک مرکزی جمهوری اسلامی ایران',
      code: '010',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'sanat-o-madan',
      name: 'Sanat O Madan Bank',
      persianName: 'بانک صنعت و معدن',
      code: '011',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'mellat',
      name: 'Mellat Bank',
      persianName: 'بانک ملت',
      code: '012',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'refah',
      name: 'Refah Bank',
      persianName: 'بانک رفاه کارگران',
      code: '013',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'maskan',
      name: 'Maskan Bank',
      persianName: 'بانک مسکن',
      code: '014',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'sepah',
      name: 'Sepah Bank',
      persianName: 'بانک سپه',
      code: '015',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'keshavarzi',
      name: 'Keshavarzi',
      persianName: 'بانک کشاورزی',
      code: '016',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'melli',
      name: 'Melli',
      persianName: 'بانک ملی ایران',
      code: '017',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'tejarat',
      name: 'Tejarat Bank',
      persianName: 'بانک تجارت',
      code: '018',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'saderat',
      name: 'Saderat Bank',
      persianName: 'بانک صادرات ایران',
      code: '019',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'tosee-saderat',
      name: 'Tose Saderat Bank',
      persianName: 'بانک توسعه صادرات',
      code: '020',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'post',
      name: 'Post Bank',
      persianName: 'پست بانک ایران',
      code: '021',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'toose-taavon',
      name: 'Tosee Taavon Bank',
      persianName: 'بانک توسعه تعاون',
      code: '022',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'tosee',
      name: 'Tosee Bank',
      persianName: 'موسسه اعتباری توسعه',
      code: '051',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'ghavamin',
      name: 'Ghavamin Bank',
      persianName: 'بانک قوامین',
      code: '052',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'karafarin',
      name: 'Karafarin Bank',
      persianName: 'بانک کارآفرین',
      code: '053',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'parsian',
      name: 'Parsian Bank',
      persianName: 'بانک پارسیان',
      code: '054',
      isAccountNumberAvailable: true,
      process: _parsianBankProc),
  BankInformation(
      nickname: 'eghtesad-novin',
      name: 'Eghtesad Novin Bank',
      persianName: 'بانک اقتصاد نوین',
      code: '055',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'saman',
      name: 'Saman Bank',
      persianName: 'بانک سامان',
      code: '056',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'pasargad',
      name: 'Pasargad Bank',
      persianName: 'بانک پاسارگاد',
      code: '057',
      isAccountNumberAvailable: true,
      process: _pasargadBankProc),
  BankInformation(
      nickname: 'sarmayeh',
      name: 'Sarmayeh Bank',
      persianName: 'بانک سرمایه',
      code: '058',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'sina',
      name: 'Sina Bank',
      persianName: 'بانک سینا',
      code: '059',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'mehr-iran',
      name: 'Mehr Iran Bank',
      persianName: 'بانک مهر ایران',
      code: '060',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'shahr',
      name: 'City Bank',
      persianName: 'بانک شهر',
      code: '061',
      isAccountNumberAvailable: true,
      process: _shahrBankProc),
  BankInformation(
      nickname: 'ayandeh',
      name: 'Ayandeh Bank',
      persianName: 'بانک آینده',
      code: '062',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'ansar',
      name: 'Ansar Bank',
      persianName: 'بانک انصار',
      code: '063',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'gardeshgari',
      name: 'Gardeshgari Bank',
      persianName: 'بانک گردشگری',
      code: '064',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'hekmat-iranian',
      name: 'Hekmat Iranian Bank',
      persianName: 'بانک حکمت ایرانیان',
      code: '065',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'dey',
      name: 'Dey Bank',
      persianName: 'بانک دی',
      code: '066',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'iran-zamin',
      name: 'Iran Zamin Bank',
      persianName: 'بانک ایران زمین',
      code: '069',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'resalat',
      name: 'Resalat Bank',
      persianName: 'بانک قرض الحسنه رسالت',
      code: '070',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'kosar',
      name: 'Kosar Credit Institute',
      persianName: 'موسسه اعتباری کوثر',
      code: '073',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'melal',
      name: 'Melal Credit Institute',
      persianName: 'موسسه اعتباری ملل',
      code: '075',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'middle-east-bank',
      name: 'Middle East Bank',
      persianName: 'بانک خاورمیانه',
      code: '078',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'noor-bank',
      name: 'Noor Credit Institution',
      persianName: 'موسسه اعتباری نور',
      code: '080',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'mehr-eqtesad',
      name: 'Mehr Eqtesad Bank',
      persianName: 'بانک مهر اقتصاد',
      code: '079',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'mehr-iran',
      name: 'Mehr Iran Bank',
      persianName: 'بانک مهر ایران',
      code: '090',
      isAccountNumberAvailable: false),
  BankInformation(
      nickname: 'iran-venezuela',
      name: 'Iran and Venezuela Bank',
      persianName: 'بانک ایران و ونزوئلا',
      code: '095',
      isAccountNumberAvailable: false),
];

AccountNumberModel _parsianBankProc(String string) {
  string = string.substring(14);
  var formatted =
      '0' + string.substring(0, 3) + '-0' + string.substring(2, 8) + '-' + string.substring(9, 12);
  return AccountNumberModel(
    accountNumber: string,
    formattedAccountNumber: formatted,
  );
}

AccountNumberModel _pasargadBankProc(String string) {
  string = string.substring(7);
  while (string[0] == '0') {
    string = string.substring(1);
  }
  string = string.substring(0, string.length - 1);
  var formatted = string.substring(0, 4) +
      '-' +
      string.substring(3, 6) +
      '-' +
      string.substring(6, 14) +
      '-' +
      string[14];
  return AccountNumberModel(
    accountNumber: string,
    formattedAccountNumber: formatted,
  );
}

AccountNumberModel _shahrBankProc(String string) {
  string = string.substring(7);
  while (string[0] == '0') {
    string = string.substring(1);
  }

  return AccountNumberModel(
    accountNumber: string,
    formattedAccountNumber: string,
  );
}

/// Banks information
final banksInfo = {for (var bank in _banksInfo) bank.code: bank};
