<div align="center">
	<p align="center">
		<img src="https://raw.githubusercontent.com/persian-tools/persian-tools/master/images/logo.png" width="200" />
	</p>
	<h1 align="center">Persian tools</h1>
    <p align="center">Persian Tools dart package which you can use in all platforms</p>

[![MIT license](https://img.shields.io/badge/License-MIT-lightblue.svg)](https://github.com/persian-tools/dart-persian-tools/blob/master/LICENSE)
[![codecov](https://codecov.io/gh/persian-tools/dart-persian-tools/branch/master/graph/badge.svg?token=2O5UD1VRHN)](https://codecov.io/gh/persian-tools/dart-persian-tools)
[![Dart Version](https://img.shields.io/badge/Dart-v2.12.0-lightblue)](https://dart.dev)
![status](https://img.shields.io/badge/under_development-lightblue.svg)
</div>
<hr/>

## Features

- [x] Adding ordinal suffixes
- [ ] Converting Persian words to number
- [ ] Converting Persian numbers to word
- [ ] Adding and removing separator to/from numbers
- [ ] Converting Persian numbers to Arabic / English numbers and reverse
- [x] Checking a string has/is Persian
- [ ] Validating Iranians national id
- [ ] Finding city and province names by national id
- [x] Calculating bills
- [ ] Checking validation of IBAN (_SHEBA_)
- [ ] Recognizing bank information by IBAN (_SHEBA_)
- [x] Validating ATM card number
- [ ] Finding name of banks by ATM card number
- [ ] Getting information from vehicle plate
- [x] Fixing and decoding URLs with whitespace
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

- #### Fixing and decoding URLs - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/url_fix.dart)

```dart
import 'package:dart_persian_tools/dart_persian_tools.dart';

void main() {
  var url = 'wss://hostname.domain/?q=i am a wrong query';
  print(urlFix(url)); // wss://hostname.domain/?q=i%20am%20a%20wrong%20query
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