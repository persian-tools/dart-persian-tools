#### Adding Ordinal Suffixes - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/add_ordinal_suffix/add_ordinal_suffix.dart)
```dart
var number = 'سی سه'; // or سی | شصت | پنجاه دو
addOrdinalSuffix(number); // سی سوم | سی اُم | شصتم | پنجاه دوم
number.withOrdinalSuffix // ... like so
```
#### Removing Ordinal Suffixes - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/remove_ordinal_suffix/remove_ordinal_suffix.dart)

```dart
var number = 'چهل و سوم'; // سی سوم | سی اُم | شصتم | پنجاه دوم
removeOrdinalSuffix(number); // سی | شصت | پنجاه دو

/// or use it as String extension method
number.withoutOrdinalSuffix; // ... like so
```

#### Converting Persian words to number - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/words_to_number/words_to_number.dart)

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

#### Converting Persian numbers to word - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/number_to_words/number_to_words.dart)

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

#### Adding and removing separator to / from numbers - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/commas/commas.dart)
```dart
addCommas('3333'); // 3,333
addCommas('۸۲۳۳۴۵'); // 823,345

removeCommas('654,562'); // 654562
removeCommas('3,365.255'); // 3365.255

'11222'.addComma // 11,222
'4,544.562'.removeComma // 4544.562
```

#### Converting Persian numbers to Arabic / English numbers and reverse - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/digits/digits.dart)
```dart
convertArToFa('السلام علیکم 14۱۲۳6٤٥'); // السلام علیکم 14۱۲۳6۴۵
convertArToEn('Persian Tools : 123٥٦٧'); // Persian Tools : 123567
convertEnToFa('سلام این هارو فارسی کن : 22۲۳۴'); // سلام این هارو فارسی کن : ۲۲۲۳۴
convertFaToEn('سلام این هارو اینگلیسی کن : 22۲۳۴'); // سلام این هارو اینگلیسی کن : 22234
```

#### Checking a string has/is Persian - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/is_persian/is_persian.dart)

```dart
isPersian('این یک متن فارسی است؟'); // true
isPersian('هل هذا نص فارسي؟'); // false
hasPersian('This text includes فارسی'); // true
hasPersian('Это персидский س текст?'); // true
hasPersian('أكد رئيس اللجنة العسكرية الممثلة لحكومة الوفاق أراضي البلاد.'); //true
```

#### Validate Iranian national ID - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/national_id/national_id.dart)

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

#### Find city and province name by national code - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/get_place_by_national_id/get_place_by_national_id.dart)

```dart
final place = getPlaceByIranNationalId('0084575948');
place?.city.name; // تهران مرکزی
place?.province.name; // تهران

/// get place with extension methods over [String] class
final nationalId = '2110990147';
nationalId.getPlaceNationalId?.city.name; // گرگان
nationalId.getPlaceNationalId?.province.name; // گلستان
```

#### Calculating Bill - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/bill/bill.dart)

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

#### Checking IBAN of the bank account (_SHEBA_) - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/sheba/sheba.dart)

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

#### Validating ATM card number - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/validate_card_number/validate_card_number.dart)

```dart
validateCardNumber('6219861034529007'); // true
validateCardNumber('6219861034529007'); // true
validateCardNumber('0000000000000000'); // false
validateCardNumber('621986103452900'); // false
```

#### Validating Iranians phone number - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/phone_number/phone_number.dart)

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

#### Finding banks name by card number - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/get_bank_name_from_card_number/get_bank_name_from_card_number.dart)

```dart
final cardNumber = '6037701689095443';

final bankInfo = getBankNameFromCardNumber(cardNumber);
bankInfo?.name; // بانک کشاورزی
bankInfo?.initCode; // 603770

/// you can also use this methods as String extension method

// get bank info from String
cardNumber.bankNameFromCard?.name; // بانک کشاورزی
```

#### Getting information from vehicle plate - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/vehicle_plate/vehicle_plate.dart)

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

#### Fixing and decoding URLs - [source](https://github.com/persian-tools/dart-persian-tools/blob/master/lib/src/core/url_fix/url_fix.dart)

```dart
var url = 'wss://hostname.domain/?q=i am a wrong query';
urlFix(url); // wss://hostname.domain/?q=i%20am%20a%20wrong%20query
```
