const units = <String, int>{
  'صفر': 0,
  'یک': 1,
  'دو': 2,
  'سه': 3,
  'چهار': 4,
  'پنج': 5,
  'شش': 6,
  'شیش': 6,
  'هفت': 7,
  'هشت': 8,
  'نه': 9,
  'ده': 10,
  'یازده': 11,
  'دوازده': 12,
  'سیزده': 13,
  'چهارده': 14,
  'پانزده': 15,
  'شانزده': 16,
  'هفده': 17,
  'هجده': 18,
  'نوزده': 19,
  'بیست': 20,
  'سی': 30,
  'چهل': 40,
  'پنجاه': 50,
  'شصت': 60,
  'هفتاد': 70,
  'هشتاد': 80,
  'نود': 90,
};

const ten = <String, int>{
  'صد': 100,
  'یکصد': 100,
  'دویست': 200,
  'سیصد': 300,
  'چهارصد': 400,
  'پانصد': 500,
  'ششصد': 600,
  'هفتصد': 700,
  'هشتصد': 800,
  'نهصد': 900,
};

const magnitude = <String, int>{
  'هزار': 1000,
  'میلیون': 1000000,
  'بیلیون': 1000000000,
  'میلیارد': 1000000000,
  'تریلیون': 1000000000000,
};

const typoList = {
  'شیش صد': 'ششصد',
  'شش صد': 'ششصد',
  'هفت صد': 'هفتصد',
  'هشت صد': 'هشتصد',
  'نه صد': 'نهصد',
};

final unitKeys = units.keys;
final tenKeys = ten.keys;
final magnitudeKeys = magnitude.keys;

final numberWords = [...unitKeys, ...tenKeys, ...magnitudeKeys];

const joiners = ['و', ' و '];
const prefixes = ['منفی', 'مثبت'];
const tokenType = {
  'UNIT': 0,
  'TEN': 1,
  'MAGNITUDE': 2,
  'DECIMAL': 3,
  'HUNDRED': 4,
};

final allWords = [...numberWords, ...joiners, ...prefixes];

const faOrdinalRegExp = 'مین\$';