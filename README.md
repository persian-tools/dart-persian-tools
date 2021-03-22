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

- [x] [Adding ordinal suffixes](https://github.com/persian-tools/dart-persian-tools#adding-ordinal-suffixes---source)
- [ ] Converting Persian words to number
- [ ] Converting Persian numbers to word
- [ ] Adding and removing separator to/from numbers
- [x] [Converting Persian numbers to Arabic / English numbers and reverse]()
- [x] [Checking a string has/is Persian](https://github.com/persian-tools/dart-persian-tools#checking-a-string-hasis-persian---source)
- [x] Validating Iranians national id
- [ ] Finding city and province names by national id
- [x] [Calculating bills](https://github.com/persian-tools/dart-persian-tools#calculating-bill---source)
- [ ] Checking validation of IBAN (_SHEBA_)
- [ ] Recognizing bank information by IBAN (_SHEBA_)
- [x] [Validating ATM card number](https://github.com/persian-tools/dart-persian-tools#validating-atm-card-number---source)
- [ ] Finding name of banks by ATM card number
- [ ] Getting information from vehicle plate
- [x] [Fixing and decoding URLs with whitespace](https://github.com/persian-tools/dart-persian-tools#fixing-and-decoding-urls---source)
## Usage

now let's look at examples and how work with apis in package

- #### Adding Ordinal Suffixes - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/add_ordinal_suffix.dart)

```dart
import 'package:dart_persian_tools/dart_persian_tools.dart';

void main() {
  var number = 'سی سه'; // or سی | شصت | پنجاه دو
  print(addOrdinalSuffix(number)); // سی سوم | سی اُم | شصتم | پنجاه دوم
  print(number.withOrdinalSuffix); // ... like so
}
```

- #### Converting Persian numbers to Arabic / English numbers and reverse - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/Digits/methods.dart)

```dart
import 'package:dart_persian_tools/dart_persian_tools.dart';

void main() {
  print(convertArToFa('السلام علیکم 14۱۲۳6٤٥')); // السلام علیکم 14۱۲۳6۴۵
  print(convertArToEn('Persian Tools : 123٥٦٧')); // Persian Tools : 123567
  print(convertEnToFa('سلام این هارو فارسی کن : 22۲۳۴')); // سلام این هارو فارسی کن : ۲۲۲۳۴
  print(convertFaToEn('سلام این هارو اینگلیسی کن : 22۲۳۴')); // سلام این هارو اینگلیسی کن : 22234
}
```

- #### Checking a string has/is Persian - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/isPersian/methods.dart)

```dart
import 'package:dart_persian_tools/dart_persian_tools.dart';

void main() {
  print(isPersian('این یک متن فارسی است؟')); // true
  print(isPersian('هل هذا نص فارسي؟')); // false
  print(hasPersian('This text includes فارسی')); // true
  print(hasPersian('Это персидский س текст?')); // true
  print(hasPersian('أكد رئيس اللجنة العسكرية الممثلة لحكومة الوفاق أراضي البلاد.')); //true
}
``` 

- #### Validate Iranian national number(code-e Melli) - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/sac/national_id.dart)

```dart
import 'package:dart_persian_tools/dart_persian_tools.dart';

void main() {
  var nationalID = '0684159414';
  print(nationalID.verifyIranianNationalId); // true
  
  ///the nationalID should contain 10 digit, so the following verifications 
  ///should return false
  nationalID = '00000';
  print(nationalID.verifyIranianNationalId); // false
  
  nationalID = '';
  print(nationalID.verifyIranianNationalId); // false
}
```

- #### Calculating Bill - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/bill.dart)

```dart
import 'package:dart_persian_tools/dart_persian_tools.dart';

void main() {
  var bill = Bill(billId: 9174639504124, paymentId: 12908197, currency: 'rial');
  print(bill.barcode); // 917463950412400012908197
  print(bill.billType); // برق 
  print(bill.amount); // 129000
  print(bill.isBillValid); // false
  print(bill.isPaymentIdValid); // false
  print(bill.isBillIdValid); // true
  // returns all the above getter as a Map with same as getters
  print(bill()); 
}
```

- #### Validating ATM card number - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/validate_card_number.dart)

```dart
import 'package:dart_persian_tools/dart_persian_tools.dart';

void main(){
  print(validateCardNumber('6219861034529007')); // true
  print(validateCardNumber('6219861034529007')); // true
  print(validateCardNumber('0000000000000000')); // false
  print(validateCardNumber('621986103452900')); // false
}
```

- #### Fixing and decoding URLs - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/url_fix.dart)

```dart
import 'package:dart_persian_tools/dart_persian_tools.dart';

void main() {
  var url = 'wss://hostname.domain/?q=i am a wrong query';
  print(urlFix(url)); // wss://hostname.domain/?q=i%20am%20a%20wrong%20query
}
```
