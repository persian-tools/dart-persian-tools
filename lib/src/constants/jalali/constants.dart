var year;
var month;
var day;
var weekday;
var hour;
var minute;
var second;
var millisecond;
var microsecond;

const yyyy = 'yyyy'; // 4 عدد سال
const YYYY = 'YYYY'; // 4 عدد سال
const yy = 'yy'; // 2 عدد سال
const YY = 'YY'; // 2 عدد سال
const mm = 'mm'; // 2 عدد ماه اگر ماه تک رقمی باشد 0 در اول ان قرار میدهد
const m = 'm'; // 1 عدد ماه اگر ماه تک رقمی باشد 0 قرار نمیدهد
const MM = 'MM'; // ماه به صورت حروفی کامل
const M = 'M'; // ماه به صورت حروفی کوتاه
const dd = 'dd'; // روز به صورت 2 عددی
const d = 'd'; // روز به صورت تک رقمی برای روز های زیر 10
const w = 'w'; // عدد هفته از ماه را بر میگرداند
const DD = 'DD'; // نام روز
const D = 'D'; // نام روز
const hh =
    'hh'; // ساعت با دو رقم اگر ساعت تک رقمی باشد 0 ابتدای عدد قرار میدهد فرمت 12 ساعته
const h = 'h'; // ساعت با تک رقم فرمت 12 ساعته
const HH = 'HH'; // ساعت با 2 رقم فرمت 24 ساعته
const H = 'H'; // ساعت با تک رقم فرمت 24 ساعته
const nn = 'nn'; // نمایشه دقیقه به صورت دو رقمی
const n = 'n'; // نمایشه دقیقه به صورت تک رقمی
const ss = 'ss'; // نمایش ثانیه دو رقمی
const s = 's'; // نمایش ثانیه تک رقمی
const SSS = 'SSS'; // نمایش میلی ثانیه
const S = 'S'; // نمایش میلی ثانیه
const uuu = 'uuu'; // نمایش میکرو ثانیه
const u = 'u'; // نمایش میکرو ثانیه
const am = 'am'; // نمایش وقت به صورت کوتاه
const AM = 'AM'; // نمایش وقت به صورت کامل

const monthShort = [
  'فرو',
  'ارد',
  'خرد',
  'تیر',
  'مرد',
  'شهر',
  'مهر',
  'آبا',
  'آذر',
  'دی',
  'بهم',
  'اسفن'
];

const monthLong = [
  'فروردین',
  'اردیبهشت',
  'خرداد',
  'تیر',
  'مرداد',
  'شهریور',
  'مهر',
  'آبان',
  'آذر',
  'دی',
  'بهمن',
  'اسفند'
];

const dayShort = [
  'دو',
  'سه',
  'چه',
  'پن',
  'جم',
  'شن',
  'یک',
];

const dayLong = [
  'دوشنبه',
  'سه شنبه',
  'چهارشنبه',
  'پنج شنبه',
  'جمعه',
  'شنبه',
  'یکشنبه',
];

const shamsiHoliday = [
  '0101',
  '0102',
  '0103',
  '0104',
  '0112',
  '0113',
  '0314',
  '0315',
  '1122',
  '1229',
];

String gregorianToJalali(DateTime dateTime,{String? formate}) {
  var y = dateTime.year;
  var m = dateTime.month;
  var d = dateTime.day;
  var sumMonthDay = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
  year = 0;
  month = 0;
  day = 0;
  if (y > 1600) {
    year = 979;
    y -= 1600;
  } else {
    year = 0;
    y -= 621;
  }
  var gy = (m > 2) ? y + 1 : y;
  var gDay = (365 * y) +
      ((gy + 3) ~/ 4) -
      ((gy + 99) ~/ 100) +
      ((gy + 399) ~/ 400) -
      80 +
      d +
      sumMonthDay[m - 1];
  year += 33 * (gDay.round() / 12053).floor();
  gDay %= 12053;
  year += 4 * (gDay.round() / 1461).floor();
  gDay %= 1461;
  year += ((gDay.round() - 1) / 365).floor();
  if (gDay > 365) day = ((gDay - 1).round() % 365);
  var days = gDay.toInt();
  if (days < 186) {
    month = 1 + (days ~/ 31);
    day = 1 + (days % 31);
  } else {
    month = 7 + ((days - 186) ~/ 30);
    day = 1 + (days - 186) % 30;
  }

    weekday = dateTime.weekday;
    hour = dateTime.hour;
    minute = dateTime.minute;
    second = dateTime.second;
    microsecond = dateTime.microsecond;
    millisecond = dateTime.millisecond;

  return toFormat(formate ??= 'yyyy-mm-dd hh:nn:ss SSS');
}

DateTime jallaliToGregorian(String dateTime) {
  Match? match = _parseFormat.firstMatch(dateTime);
  if (match != null) {
    int parseIntOrZero(String? matched) {
      if (matched == null) return 0;
      return int.parse(matched);
    }

    var y = int.parse(match[1]!);
    var m = int.parse(match[2]!);
    var d = int.parse(match[3]!);
    var hour = parseIntOrZero(match[4]);
    var minute = parseIntOrZero(match[5]);
    var second = parseIntOrZero(match[6]);

    int gY;
    if (y > 979) {
      gY = 1600;
      y -= 979;
    } else {
      gY = 621;
    }

    var days = (365 * y) +
        ((y / 33).floor() * 8) +
        (((y % 33) + 3) / 4) +
        78 +
        d +
        (((m < 7) ? (m - 1) * 31 : (((m - 7) * 30) + 186)));
    gY += 400 * (days ~/ 146097);
    days %= 146097;
    if (days.floor() > 36524) {
      gY += 100 * (--days ~/ 36524);
      days %= 36524;
      if (days >= 365) days++;
    }
    gY += 4 * (days ~/ 1461);
    days %= 1461;
    gY += (days - 1) ~/ 365;

    if (days > 365) days = (days - 1) % 365;
    var gD = (days + 1).floor();
    var montDays = [
      0,
      31,
      (((gY % 4 == 0) && (gY % 100 != 0)) || (gY % 400 == 0)) ? 29 : 28,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ];
    var i = 0;
    for (; i <= 12; i++) {
      if (gD <= montDays[i]) break;
      gD -= montDays[i];
    }
    return DateTime(gY, i, gD,hour,minute,second);
  } else {
    return DateTime.now();
  }
}

String digits(int? value, int length) {
  var ret = '$value';
  if (ret.length < length) {
    ret = '0' * (length - ret.length) + ret;
  }
  return ret;
}



  String toAgo(DateTime dateTime) {
    var time = DateTime.now().millisecondsSinceEpoch - dateTime.millisecondsSinceEpoch;
    final num seconds = time / 1000;
    final num minutes = seconds / 60;
    final num hours = minutes / 60;
    final num days = hours / 24;
    final num months = days / 30;
    final num years = days / 365;

    String result;
    if (seconds < 45) {
      result = 'لحضاتی قبل';
    } else if (seconds < 90) {
      result = 'یک دقیقه قبل';
    } else if (minutes < 45) {
      result = '${minutes.round()} دقیقه قبل';
    } else if (minutes < 90) {
      result = 'یک ساعت قبل';
    } else if (hours < 24) {
      result = '${minutes.round()}  ساعت قبل';
    } else if (hours < 48) {
      result = 'بک روز قبل';
    } else if (days < 30) {
      result = '${hours.round()} روز قبل';
    } else if (days < 60) {
      result = 'یک ماه قبل';
    } else if (days < 365) {
      result = '${months.round()} ماه قبل';
    } else if (years < 2) {
      result = 'یک سال قبل';
    } else {
      result = '${months.round()} سال قبل';
    }
    return result;
  }

  

String toFormat(String format) {
  var newFormat = format;
  if (newFormat.contains(yyyy) || newFormat.contains(YYYY)) {
    newFormat = newFormat.replaceFirst(yyyy, digits(year, 4));
  }
  if (newFormat.contains(yy) || newFormat.contains(YY)) {
    newFormat = newFormat.replaceFirst(yy, digits(year! % 100, 2));
  }
  if (newFormat.contains(mm)) {
    newFormat = newFormat.replaceFirst(mm, digits(month, 2));
  }
  if (newFormat.contains(m)) {
    newFormat = newFormat.replaceFirst(m, month.toString());
  }
  if (newFormat.contains(MM)) {
    newFormat = newFormat.replaceFirst(MM, monthLong[month! - 1]);
  }
  if (newFormat.contains(M)) {
    newFormat = newFormat.replaceFirst(M, monthShort[month! - 1]);
  }
  if (newFormat.contains(dd)) {
    newFormat = newFormat.replaceFirst(dd, digits(day, 2));
  }
  if (newFormat.contains(d)) {
    newFormat = newFormat.replaceFirst(d, day.toString());
  }
  if (newFormat.contains(w)) {
    newFormat = newFormat.replaceFirst(w, ((day! + 7) ~/ 7).toString());
  }
  if (newFormat.contains(DD)) {
    newFormat = newFormat.replaceFirst(DD, dayLong[weekday! - 1]);
  }
  if (newFormat.contains(D)) {
    newFormat = newFormat.replaceFirst(D, dayShort[weekday! - 1]);
  }
  if (newFormat.contains(HH)) {
    newFormat = newFormat.replaceFirst(HH, digits(hour, 2));
  }
  if (newFormat.contains(H)) {
    newFormat = newFormat.replaceFirst(H, hour.toString());
  }
  if (newFormat.contains(hh)) {
    newFormat = newFormat.replaceFirst(hh, digits(hour! % 12, 2));
  }
  if (newFormat.contains(h)) {
    newFormat = newFormat.replaceFirst(h, (hour! % 12).toString());
  }
  if (newFormat.contains(AM)) {
    newFormat =
        newFormat.replaceFirst(AM, hour! < 12 ? 'قبل از ظهر' : 'بعد از ظهر');
  }
  if (newFormat.contains(am)) {
    newFormat = newFormat.replaceFirst(am, hour! < 12 ? 'ق.ظ' : 'ب.ظ');
  }
  if (newFormat.contains(nn)) {
    newFormat = newFormat.replaceFirst(nn, digits(minute, 2));
  }
  if (newFormat.contains(n)) {
    newFormat = newFormat.replaceFirst(n, minute.toString());
  }
  if (newFormat.contains(ss)) {
    newFormat = newFormat.replaceFirst(ss, digits(second, 2));
  }
  if (newFormat.contains(s)) {
    newFormat = newFormat.replaceFirst(s, second.toString());
  }
  if (newFormat.contains(SSS)) {
    newFormat = newFormat.replaceFirst(SSS, digits(millisecond, 3));
  }
  if (newFormat.contains(S)) {
    newFormat = newFormat.replaceFirst(S, millisecond.toString());
  }
  if (newFormat.contains(uuu)) {
    newFormat = newFormat.replaceFirst(uuu, digits(microsecond, 2));
  }
  if (newFormat.contains(u)) {
    newFormat = newFormat.replaceFirst(u, microsecond.toString());
  }
  return newFormat;
}

final RegExp _parseFormat =
    RegExp(r'^([+-]?\d{4,6})-?(\d\d)-?(\d\d)' // Day part.
        r'(?:[ T](\d\d)(?::?(\d\d)(?::?(\d\d)(?:[.,](\d+))?)?)?' // Time part.
        r'( ?[zZ]| ?([-+])(\d\d)(?::?(\d\d))?)?)?$');
