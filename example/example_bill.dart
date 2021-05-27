import 'package:persian_tools/persian_tools.dart';

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
