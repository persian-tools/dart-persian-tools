import 'package:persian_tools/src/constants/jalali/constants.dart';

class Jalali {
  String now({String? formate}) {
    return gregorianToJalali(DateTime.now());
  }
}

extension JalaliConvertor on String {
  String toJalali({String? formate}) =>
      gregorianToJalali(DateTime.parse(this), formate: formate);

  DateTime toGregorian() => jallaliToGregorian(this);

  num jalaliToTimeStamp() => jallaliToGregorian(this).millisecondsSinceEpoch;

  String timeStampToAgo({inMilliseconds = false}) =>
      toAgo(DateTime.fromMillisecondsSinceEpoch(
          int.tryParse(this)! * (inMilliseconds ? 1 : 1000)));

  String deteTimeToAgo() => toAgo(DateTime.parse(this));

  String jalaliToAgo() => toAgo(jallaliToGregorian(this));

  String timeStampToJalai({inMilliseconds = false, String? formate}) =>
      gregorianToJalali(
          DateTime.fromMillisecondsSinceEpoch(
              int.tryParse(this)! * (inMilliseconds ? 1 : 1000)),
          formate: formate);
}
