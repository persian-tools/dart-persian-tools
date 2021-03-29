<div align="center">
	<p align="center">
		<img src="https://raw.githubusercontent.com/persian-tools/persian-tools/master/images/logo.png" width="200" />
	</p>
	<h1 align="center">Persian tools</h1>
    <p align="center">Persian Tools dart package which you can use in all platforms</p>

[![MIT license](https://img.shields.io/badge/License-MIT-lightblue.svg)](https://github.com/persian-tools/dart-persian-tools/blob/master/LICENSE)
[![codecov](https://codecov.io/gh/persian-tools/dart-persian-tools/branch/master/graph/badge.svg?token=2O5UD1VRHN)](https://codecov.io/gh/persian-tools/dart-persian-tools)
[![CI/CD](https://github.com/persian-tools/dart-persian-tools/workflows/Test%20master/badge.svg)]()
[![Dart Version](https://img.shields.io/badge/Dart-v2.12.0-lightblue)](https://dart.dev)
![status](https://img.shields.io/badge/under_development-lightblue.svg)
</div>
<hr/>

## Features

- [x] [Adding ordinal suffixes](#adding-ordinal-suffixes---source)
- [ ] Converting Persian words to number
- [ ] Converting Persian numbers to word
- [ ] Adding and removing separator to/from numbers
- [x] [Converting Persian numbers to Arabic / English numbers and reverse](#converting-persian-numbers-to-arabic--english-numbers-and-reverse---source)
- [x] [Checking a string has/is Persian](#checking-a-string-hasis-persian---source)
- [x] [Validating Iranians national id](#validate-iranian-national-id---source)
- [x] [Finding city and province names by national id](#find-city-and-province-name-by-national-code---source)
- [x] [Calculating bills](#calculating-bill---source)
- [x] [Checking IBAN of the bank account (_SHEBA_)](#checking-iban-of-the-bank-account-sheba---source)
- [x] [Validating ATM card number](#validating-atm-card-number---source)
- [ ] Finding name of banks by ATM card number
- [ ] Getting information from vehicle plate
- [x] [Fixing and decoding URLs with whitespace](https://github.com/persian-tools/dart-persian-tools#fixing-and-decoding-urls---source)
## Usage

now let's look at examples and how work with apis in package

- #### Adding Ordinal Suffixes - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/add_ordinal_suffix/add_ordinal_suffix.dart)

```dart
var number = 'سی سه'; // or سی | شصت | پنجاه دو
addOrdinalSuffix(number); // سی سوم | سی اُم | شصتم | پنجاه دوم
number.withOrdinalSuffix // ... like so
```

- #### Converting Persian numbers to Arabic / English numbers and reverse - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/digits/methods.dart)

```dart
convertArToFa('السلام علیکم 14۱۲۳6٤٥'); // السلام علیکم 14۱۲۳6۴۵
convertArToEn('Persian Tools : 123٥٦٧'); // Persian Tools : 123567
convertEnToFa('سلام این هارو فارسی کن : 22۲۳۴'); // سلام این هارو فارسی کن : ۲۲۲۳۴
convertFaToEn('سلام این هارو اینگلیسی کن : 22۲۳۴'); // سلام این هارو اینگلیسی کن : 22234
```

- #### Checking a string has/is Persian - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/is_persian/methods.dart)

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

- #### Find city and province name by national code - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core\get_place_by_national_id\get_place_by_national_id.dart)

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

- #### Checking IBAN of the bank account (_SHEBA_) - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/Sheba/methods.dart)
  
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

- #### Fixing and decoding URLs - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/url_fix/url_fix.dart)

```dart
var url = 'wss://hostname.domain/?q=i am a wrong query';
urlFix(url); // wss://hostname.domain/?q=i%20am%20a%20wrong%20query
```
