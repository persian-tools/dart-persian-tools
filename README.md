<div align="center">
	<p align="center">
		<img src="https://raw.githubusercontent.com/persian-tools/persian-tools/master/images/logo.png" width="200" />
	</p>
	<h1 align="center">Persian tools</h1>
    <p align="center">Persian Tools dart package which you can use in all platforms</p>

[![MIT license](https://img.shields.io/badge/License-MIT-lightblue.svg)](https://github.com/persian-tools/dart-persian-tools/blob/master/LICENSE)
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
- [ ] Validating Iranians national id
- [ ] Finding city and province names by national id
- [x] Calculating bills
- [ ] Checking validation of IBAN (_SHEBA_)
- [ ] Recognizing bank information by IBAN (_SHEBA_)
- [ ] Validating ATM card number
- [ ] Finding name of banks by ATM card number
- [ ] Getting information from vehicle plate

## Usage
now let's look at examples and how work with apis in package
- #### Adding Ordinal Suffixes
```dart
import 'package:dart_persian_tools/dart_persian_tools.dart';

void main() {
  var number = 'سی سه' // or سی | شصت | پنجاه دو
  print(addOrdinalSuffix(number)); // سی سوم | سی اُم | شصتم | پنجاه دوم
  print(number.withOrdinalSuffix); // ... like so
}
```
