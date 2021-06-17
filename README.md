<div align="center">
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-2-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->
	<p align="center">
		<img src="https://raw.githubusercontent.com/persian-tools/persian-tools/master/images/logo.png" width="200" />
	</p>
	<h1 align="center">Persian tools</h1>
    <p align="center">Persian Tools dart package which you can use in all platforms</p>

[![MIT license](https://img.shields.io/badge/License-MIT-lightblue.svg)](https://github.com/persian-tools/dart-persian-tools/blob/master/LICENSE)
[![codecov](https://codecov.io/gh/persian-tools/dart-persian-tools/branch/master/graph/badge.svg?token=2O5UD1VRHN)](https://codecov.io/gh/persian-tools/dart-persian-tools)
[![CI/CD](https://github.com/persian-tools/dart-persian-tools/workflows/Test%20master/badge.svg)]()
[![Dart Version](https://img.shields.io/badge/Dart->=2.12.0%20<3.0.0-lightblue)](https://dart.dev)
[![pub version](https://img.shields.io/pub/v/persian_tools)](https://pub.dev/packages/persian_tools)
![status](https://img.shields.io/badge/under_development-lightblue.svg)
</div>
<hr/>

## Features

- [Removing ordinal suffixes](#removing-ordinal-suffixes---source)
- [Adding ordinal suffixes](#adding-ordinal-suffixes---source)
- [Converting Persian words to number](#converting-persian-words-to-number---source)
- [Converting Persian numbers to word](#converting-persian-numbers-to-word---source)
- [Adding and removing separator to / from numbers](#adding-and-removing-separator-to--from-numbers---source)
- [Converting Persian numbers to Arabic / English numbers and reverse](#converting-persian-numbers-to-arabic--english-numbers-and-reverse---source)
- [Checking a string has/is Persian](#checking-a-string-hasis-persian---source)
- [Validating Iranians national id](#validate-iranian-national-id---source)
- [Finding city and province names by national id](#find-city-and-province-name-by-national-code---source)
- [Calculating bills](#calculating-bill---source)
- [Checking IBAN of the bank account (_SHEBA_)](#checking-iban-of-the-bank-account-sheba---source)
- [Validating ATM card number](#validating-atm-card-number---source)
- [Validating Iranians phone number](#validating-iranians-phone-number---source)
- [Finding banks name by ATM card number](#finding-banks-name-by-card-number---source)
- [Getting information from vehicle plate](#getting-information-from-vehicle-plate---source)
- [Fixing and decoding URLs with whitespace](#fixing-and-decoding-urls---source)

## Usage

now let's look at examples and how work with apis in package

- #### Adding Ordinal Suffixes - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/add_ordinal_suffix/add_ordinal_suffix.dart)

```dart
var number = 'سی سه'; // or سی | شصت | پنجاه دو
addOrdinalSuffix(number); // سی سوم | سی اُم | شصتم | پنجاه دوم

/// or use it as String extension method
number.withOrdinalSuffix // ... like so
```

- #### Removing Ordinal Suffixes - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/remove_ordinal_suffix/remove_ordinal_suffix.dart)

```dart
var number = 'چهل و سوم'; // سی سوم | سی اُم | شصتم | پنجاه دوم
removeOrdinalSuffix(number); // سی | شصت | پنجاه دو

/// or use it as String extension method
number.withoutOrdinalSuffix; // ... like so
```

- #### Converting Persian words to number - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/words_to_number/words_to_number.dart)

```dart
final words = 'سه هزار دویست و دوازده';

/// use [wordsToNumber] method to convert [words] to int number
wordsToNumber(words); // 3212

/// use [wordsToNumberString] method to convert [words] to String
wordsToNumberString(words); // '3212' as String

/// [wordsToNumberString] also has two optional parameter
/// use [digit] optional parameter to convert the digits to specific local digits
/// use [addComma] to add comma between the every 3 digits
wordsToNumberString(
words,
digits: DigitLocale.fa,
addComma: true,
); // '۳,۲۱۲' as String

/// or you can easily use extension methods on String object
words.convertWordsToNumber(); // 3212

words.convertWordsToNumberString(); // '3212' as String
```

- #### Converting Persian numbers to word - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/number_to_words/number_to_words.dart)

```dart
final stringDigit = '257,433';
final intDigit = -128;

/// use [numberToWordsString] method to convert [stringDigit] to persian

numberToWordsString(stringDigit); // 'دویست و پنجاه و هفت هزار و چهارصد و سی و سه'

/// [numberToWordsString] also has an optional parameter
/// by default [ordinal] is [false], [true] makes the output an ordinal word

numberToWordsString(stringDigit, ordinal: true); // 'دویست و پنجاه و هفت هزار و چهارصد و سی و سوم'

/// use [numberToWordsInt] method to convert [intDigit] to persian
numberToWords(intDigit); // 'منفی صد و بیست و هشت'

/// [numberToWordsInt] also has an optional parameter
/// by default [ordinal] is [false], [true] makes the output an ordinal word
numberToWords(intDigit, ordinal: true); // 'منفی صد و بیست و هشتم'

/// you can simply use extension methods on int or String objects
stringDigit.convertNumToWords(); // 'دویست و پنجاه و هفت هزار و چهارصد و سی و سه'

intDigit.convertNumToWords(); // 'منفی صد و بیست و هشت'
```

- #### Adding and removing separator to / from numbers - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/commas/commas.dart)

```dart
addCommas('3333'); // 3,333
addCommas('۸۲۳۳۴۵'); // 823,345

removeCommas('654,562'); // 654562
removeCommas('3,365.255'); // 3365.255

'11222'.addComma // 11,222
'4,544.562'.removeComma // 4544.562
```

- #### Converting Persian numbers to Arabic / English numbers and reverse - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/digits/digits.dart)

```dart
convertArToFa('السلام علیکم 14۱۲۳6٤٥'); // السلام علیکم 14۱۲۳6۴۵
convertArToEn('Persian Tools : 123٥٦٧'); // Persian Tools : 123567
convertEnToFa('سلام این هارو فارسی کن : 22۲۳۴'); // سلام این هارو فارسی کن : ۲۲۲۳۴
convertFaToEn('سلام این هارو اینگلیسی کن : 22۲۳۴'); // سلام این هارو اینگلیسی کن : 22234
```

- #### Checking a string has/is Persian - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/is_persian/is_persian.dart)

```dart
isPersian('این یک متن فارسی است؟'); // true
isPersian('هل هذا نص فارسي؟'); // false
hasPersian('This text includes فارسی'); // true
hasPersian('Это персидский س текст?'); // true
hasPersian('أكد رئيس اللجنة العسكرية الممثلة لحكومة الوفاق أراضي البلاد.'); //true
```

- #### Validate Iranian national ID - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/national_id/national_id.dart)

```dart
var nationalID = '0684159414';
verifyIranianNationalId(nationalID); // true
  
///the nationalID should contain 10 digit, so the following verifications
///should return false
nationalID = '00000';
verifyIranianNationalId(nationalID); // false

/// verify nationalId with extension methods over [String] class
nationalID = '';
nationalID.isIranianNationalId; // false
```

- #### Find city and province name by national code - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/get_place_by_national_id/get_place_by_national_id.dart)

```dart
final place = getPlaceByIranNationalId('0084575948');
place?.city.name; // تهران مرکزی
place?.province.name; // تهران

/// get place with extension methods over [String] class
final nationalId = '2110990147';
nationalId.getPlaceNationalId?.city.name; // گرگان
nationalId.getPlaceNationalId?.province.name; // گلستان
```

- #### Calculating Bill - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/bill/bill.dart)

```dart
var bill = Bill(billId: 9174639504124, paymentId: 12908197, currency: 'rial');
bill.barcode // 917463950412400012908197
bill.billType // برق 
bill.amount // 129000
bill.isBillValid // false
bill.isPaymentIdValid // false
bill.isBillIdValid // true
// returns all the above getter as a Map with same as getters
bill();
```

- #### Checking IBAN of the bank account (_SHEBA_) - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/sheba/sheba.dart)

```dart
var sheba = Sheba('IR820540102680020817909002');
var bank = sheba(); // Returns nullable object of BankInformation
bank?.nickname // nickname of bank
bank?.name // complete name of bank
bank?.persianName // complete persian name of bank
bank?.code // code of bank
// true means with sheba package can take account number, false means package can't
bank?.isAccountNumberAvailable
bank?.accountNumber // account number in simple numbers
bank?.formattedAccountNumber // account number with hyphen
bank?.process
sheba.isValid // true
```

- #### Validating ATM card number - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/validate_card_number/validate_card_number.dart)

```dart
validateCardNumber('6219861034529007'); // true
validateCardNumber('6219861034529007'); // true
validateCardNumber('0000000000000000'); // false
validateCardNumber('621986103452900'); // false
```

- #### Validating Iranians phone number - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/phone_number/phone_number.dart)

```dart
final phoneNumber = '09022002580';

// phone number validator
phoneNumberValidator(phoneNumber); // true

// phone number prefix
getPhonePrefix(phoneNumber); // 902

// phone number detail
final operatorDetail = getPhoneNumberDetail(phoneNumber);
operatorDetail?.name; // ایرانسل
operatorDetail?.provinces; // []
operatorDetail?.base; // کشوری
operatorDetail?.type; // SimCartType.both

/// you can also use this methods as String extension method

// phone number validator
phoneNumber.isPhoneNumber; // true

// phone number prefix
phoneNumber.phoneNumberPrefix; // 902

// phone number detail
phoneNumber.phoneNumberDetail?.name; // ایرانسل
```

- #### Finding banks name by card number - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/get_bank_name_from_card_number/get_bank_name_from_card_number.dart)

```dart
final cardNumber = '6037701689095443';

final bankInfo = getBankNameFromCardNumber(cardNumber);
bankInfo?.name; // بانک کشاورزی
bankInfo?.initCode; // 603770

/// you can also use this methods as String extension method

// get bank info from String
cardNumber.bankNameFromCard?.name; // بانک کشاورزی
```

- #### Getting information from vehicle plate - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/vehicle_plate/vehicle_plate.dart)

```dart
var motorcyclePlate = Plate(plate: '12345678');
motorcyclePlate.info.type // Motorcycle
motorcyclePlate.info.template // 123-45678
motorcyclePlate.info.province // مرکز تهران
motorcyclePlate.info.category // null because its type is Motorcycle
motorcyclePlate.isValid // true

// because of persian language you may see plate in wrong form
var carPlate = Plate(plate: '12ب14547');
carPlate.info.type // Car
carPlate.info.template // 12{B}145{Iran}47 , B=ب  Iran=ایران
carPlate.info.province // مرکزی
carPlate.info.category // شخصی
carPlate.isValid // true

// you can also create [Plate] with below String extension method
var motorPlate =  '12345678'.createVehiclePlate;
motorPlate.info.type // Motorcycle
motorPlate.info.template // 123-45678
motorPlate.info.province // مرکز تهران
motorPlate.info.category // null because its type is Motorcycle
motorPlate.isValid // true
```

- #### Fixing and decoding URLs - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/url_fix/url_fix.dart)

```dart
var url = 'wss://hostname.domain/?q=i am a wrong query';
urlFix(url); // wss://hostname.domain/?q=i%20am%20a%20wrong%20query
```

## Contributing
Thank you for your interest in contributing! For more detail about contributing, please check out the [CONTRIBUTING.md file](https://github.com/persian-tools/dart-persian-tools/blob/master/CONTRIBUTING.md "CONTRIBUTING.md file").

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/EhsanAramide"><img src="https://avatars.githubusercontent.com/u/72789505?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Ehsan Aramide</b></sub></a><br /><a href="https://github.com/persian-tools/dart-persian-tools/commits?author=EhsanAramide" title="Code">💻</a> <a href="https://github.com/persian-tools/dart-persian-tools/commits?author=EhsanAramide" title="Documentation">📖</a> <a href="#example-EhsanAramide" title="Examples">💡</a> <a href="#maintenance-EhsanAramide" title="Maintenance">🚧</a> <a href="https://github.com/persian-tools/dart-persian-tools/pulls?q=is%3Apr+reviewed-by%3AEhsanAramide" title="Reviewed Pull Requests">👀</a> <a href="https://github.com/persian-tools/dart-persian-tools/commits?author=EhsanAramide" title="Tests">⚠️</a></td>
    <td align="center"><a href="https://github.com/payam-zahedi"><img src="https://avatars.githubusercontent.com/u/47558577?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Payam Zahedi</b></sub></a><br /><a href="https://github.com/persian-tools/dart-persian-tools/commits?author=payam-zahedi" title="Code">💻</a> <a href="https://github.com/persian-tools/dart-persian-tools/commits?author=payam-zahedi" title="Documentation">📖</a> <a href="#example-payam-zahedi" title="Examples">💡</a> <a href="#maintenance-payam-zahedi" title="Maintenance">🚧</a> <a href="https://github.com/persian-tools/dart-persian-tools/pulls?q=is%3Apr+reviewed-by%3Apayam-zahedi" title="Reviewed Pull Requests">👀</a> <a href="https://github.com/persian-tools/dart-persian-tools/commits?author=payam-zahedi" title="Tests">⚠️</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!