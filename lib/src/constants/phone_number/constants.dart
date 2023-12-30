import 'package:persian_tools/src/core/phone_number/models.dart';

final mobileRegex = RegExp(r'^(?:[+|0{2}]?98)?(?:0)?(\d{3})+(\d{3})+(\d{4})$');

const MCI = {
  '910': OperatorDetail(
    base: 'کشوری',
    provinces: [],
    type: SimCardType.both,
    operator: Operator.MCI,
  ),
  '914': OperatorDetail(
    provinces: ['آذربایجان شرقی', 'اردبیل', 'اصفهان'],
    base: 'آذربایجان غربی',
    type: SimCardType.both,
    operator: Operator.MCI,
  ),
  '911': OperatorDetail(
    provinces: ['گلستان', 'گیلان'],
    base: 'مازندران',
    type: SimCardType.both,
    operator: Operator.MCI,
  ),
  '912': OperatorDetail(
    provinces: [
      'البرز',
      'زنجان',
      'سمنان',
      'قزوین',
      'قم',
      'برخی از شهرستان های استان مرکزی'
    ],
    base: 'تهران',
    type: SimCardType.permanent,
    operator: Operator.MCI,
  ),
  '913': OperatorDetail(
    provinces: ['یزد', 'چهارمحال و بختیاری', 'کرمان'],
    base: 'اصفهان',
    type: SimCardType.both,
    operator: Operator.MCI,
  ),
  '915': OperatorDetail(
    provinces: ['خراسان شمالی', 'خراسان جنوبی', 'سیستان و بلوچستان'],
    base: 'خراسان رضوی',
    type: SimCardType.both,
    operator: Operator.MCI,
  ),
  '916': OperatorDetail(
    provinces: ['لرستان', 'فارس', 'اصفهان'],
    base: 'خوزستان',
    type: SimCardType.both,
    operator: Operator.MCI,
  ),
  '917': OperatorDetail(
    provinces: ['بوشهر', 'کهگیلویه و بویر احمد', 'هرمزگان'],
    base: 'فارس',
    type: SimCardType.both,
    operator: Operator.MCI,
  ),
  '918': OperatorDetail(
    provinces: ['کردستان', 'ایلام', 'همدان'],
    base: 'کرمانشاه',
    type: SimCardType.both,
    operator: Operator.MCI,
  ),
  '919': OperatorDetail(
    provinces: ['البرز', 'سمنان', 'قم', 'قزوین', 'زنجان'],
    base: 'تهران',
    type: SimCardType.credit,
    operator: Operator.MCI,
  ),
  '990': OperatorDetail(
    provinces: [],
    base: 'کشوری',
    type: SimCardType.credit,
    operator: Operator.MCI,
  ),
  '991': OperatorDetail(
    provinces: [],
    base: 'کشوری',
    type: SimCardType.both,
    operator: Operator.MCI,
  ),
  '992': OperatorDetail(
    provinces: [],
    base: 'کشوری',
    type: SimCardType.credit,
    operator: Operator.MCI,
  ),
  '993': OperatorDetail(
    provinces: [],
    base: 'کشوری',
    type: SimCardType.credit,
    operator: Operator.MCI,
  ),
  '994': OperatorDetail(
    provinces: [],
    base: 'کشوری',
    type: SimCardType.credit,
    operator: Operator.MCI,
  ),
  '995': OperatorDetail(
    provinces: [],
    base: 'کشوری',
    type: SimCardType.credit,
    operator: Operator.MCI,
  ),
  '996': OperatorDetail(
    provinces: [],
    base: 'کشوری',
    type: SimCardType.credit,
    operator: Operator.MCI,
  ),
};

const taliya = {
  '932': OperatorDetail(
    provinces: [],
    base: 'کشوری',
    type: SimCardType.credit,
    operator: Operator.taliya,
  ),
};

const rightTel = {
  '920': OperatorDetail(
    provinces: [],
    base: 'کشوری',
    type: SimCardType.permanent,
    operator: Operator.rightTel,
  ),
  '921': OperatorDetail(
    provinces: [],
    base: 'کشوری',
    type: SimCardType.credit,
    operator: Operator.rightTel,
  ),
  '922': OperatorDetail(
    provinces: [],
    base: 'کشوری',
    type: SimCardType.credit,
    operator: Operator.rightTel,
  ),
};

const defaultIrancellModel = OperatorDetail(
  provinces: [],
  base: 'کشوری',
  type: SimCardType.both,
  operator: Operator.irancell,
);

const irancell = {
  '900': defaultIrancellModel,
  '930': defaultIrancellModel,
  '933': defaultIrancellModel,
  '935': defaultIrancellModel,
  '936': defaultIrancellModel,
  '937': defaultIrancellModel,
  '938': defaultIrancellModel,
  '939': defaultIrancellModel,
  '901': defaultIrancellModel,
  '902': defaultIrancellModel,
  '903': defaultIrancellModel,
  '905': defaultIrancellModel,
  '904': OperatorDetail(
    provinces: [],
    base: 'کشوری',
    model: 'سیم‌کارت کودک',
    type: SimCardType.credit,
    operator: Operator.irancell,
  ),
  '941': OperatorDetail(
    provinces: [],
    base: 'کشوری',
    model: 'TD-LTE',
    type: SimCardType.credit,
    operator: Operator.irancell,
  ),
};

const shatelMobile = {
  '998': OperatorDetail(
    provinces: [],
    base: 'کشوری',
    type: SimCardType.credit,
    operator: Operator.shatelMobile,
  ),
};

const samanTel = {
  '999': OperatorDetail(
    provinces: [],
    base: 'کشوری',
    type: SimCardType.both,
    operator: Operator.samanTel,
  ),
};

final List<String> prefixes = [
  ...MCI.keys,
  ...taliya.keys,
  ...rightTel.keys,
  ...irancell.keys,
  ...shatelMobile.keys,
  ...samanTel.keys,
];

final operators = {
  ...MCI,
  ...taliya,
  ...irancell,
  ...shatelMobile,
  ...rightTel,
  ...samanTel,
};

const shatelName = 'شاتل موبایل';

const MCIName = 'همراه اول';

const irancellName = 'ایرانسل';

const taliaName = 'تالیا';

const rightTelName = 'رایتل';

const samanTelName = 'سامانتل';
