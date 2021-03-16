import 'package:dart_persian_tools/dart_persian_tools.dart';

void main() {
  var bill = Bill(billId: 9174639504124, paymentId: 12908197, currency: 'rial');
  print(bill.barcode);
  print(bill.billType);
  print(bill.amount);
  print(bill.isBillValid);
  print(bill.isPaymentIdValid);
  print(bill.isBillIdValid);
  print(bill()); // returns all the above getter as a Map
}
