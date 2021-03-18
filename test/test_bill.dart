import 'package:dart_persian_tools/dart_persian_tools.dart';
import 'package:test/test.dart';

void main() {
  group('test bill.dart', () {
    test('calculating bill amount', () {
      // first bill
      expect(
        Bill(billId: 1117753200140, paymentId: 12070160, currency: 'rial')
            .amount,
        equals(120000),
      );
      expect(
        Bill(billId: 1117753200140, paymentId: 12070160).amount,
        equals(12000),
      );

      // second bill
      expect(
        Bill(billId: 1177809000142, paymentId: 570108, currency: 'rial').amount,
        equals(5000),
      );
      expect(
        Bill(billId: 1177809000142, paymentId: 570108).amount,
        equals(500),
      );

      // third bill
      expect(
        Bill(billId: 1117753200140, paymentId: 1770165, currency: 'rial')
            .amount,
        equals(17000),
      );
      expect(
        Bill(billId: 1117753200140, paymentId: 1770165).amount,
        equals(1700),
      );
    }); // test 'calculating bill amount'

    test('getting bill type', () {
      // first bill
      expect(
        Bill(billId: 7748317800142, paymentId: 1770160, currency: 'rial')
            .billType,
        equals('تلفن ثابت'),
      );

      // second bill
      expect(
        Bill(billId: 9174639504124, paymentId: 12908197).billType,
        equals('برق'),
      );

      // third bill
      expect(
        Bill(billId: 2050327604613, paymentId: 1070189).billType,
        equals('آب'),
      );

      // fourth bill
      expect(
        Bill(billId: 9100074409151, paymentId: 12908190).billType,
        equals('تلفن همراه'),
      );
    }); // test 'getting bill type'

    test('check bill id validation', () {
      // first bill
      expect(
        Bill(billId: 7748317800142, paymentId: 1770160).isBillIdValid,
        equals(true),
      );

      // second bill
      expect(
        Bill(billId: 9174639504124, paymentId: 1290819).isBillIdValid,
        equals(true),
      );

      // third bill
      expect(
        Bill(billId: 2050327604613, paymentId: 1070189).isBillIdValid,
        equals(true),
      );

      // fourth bill
      expect(
        Bill(billId: 2234322344613, paymentId: 1070189).isBillIdValid,
        equals(false),
      );
    }); // test 'check bill id validation'

    test('check payment id validation', () {
      // first bill
      expect(
        Bill(billId: 7748317800142, paymentId: 1770160).isPaymentIdValid,
        equals(true),
      );

      // second bill
      expect(
        Bill(billId: 9174639504124, paymentId: 12908197).isPaymentIdValid,
        equals(false),
      );

      // third bill
      expect(
        Bill(billId: 2050327604613, paymentId: 1070189).isPaymentIdValid,
        equals(true),
      );

      // fourth bill
      expect(
        Bill(billId: 2234322344613, paymentId: 1070189).isPaymentIdValid,
        equals(false),
      );
    }); // test 'check payment id validation'

    test('check the bill validation', () {
      //first bill
      expect(
        Bill(billId: 7748317800142, paymentId: 1770160).isBillValid,
        equals(true),
      );

      // second bill
      expect(
        Bill(billId: 9174639504124, paymentId: 12908197).isBillValid,
        equals(false),
      );

      // third bill
      expect(
        Bill(billId: 2050327604613, paymentId: 1070189).isBillValid,
        equals(true),
      );

      // fourth bill
      expect(
        Bill(billId: 2234322344613, paymentId: 1070189).isBillValid,
        equals(false),
      );
    }); // test 'check the bill validation'

    test('test barcode getter', () {
      // first bill
      expect(
        Bill(billId: 2234322344613, paymentId: 1070189).barcode,
        equals('22343223446130001070189'),
      );

      // second bill
      expect(
        Bill(billId: 7748317800142, paymentId: 1770160).barcode,
        equals('77483178001420001770160'),
      );

      // third bill
      expect(
        Bill(billId: 9174639504124, paymentId: 12908197).barcode,
        equals('917463950412400012908197'),
      );

      // fourth bill
      expect(
        Bill(billId: 2050327604613, paymentId: 1070189).barcode,
        equals('20503276046130001070189'),
      );
    }); // test 'test barcode getter'

    test('test findByBarcode method from _barcode', () {
      var bill = Bill(barcode: '22343223446130001070189');
      expect(bill.findByBarcode()[0], equals(2234322344613));
      expect(bill.findByBarcode()[1], equals(1070189));
    }); // test 'test findByBarcode method'

    test('test findByBarcode method from the given barcode', () {
      var bill = Bill();
      expect(
        bill.findByBarcode('22343223446130001070189')[0],
        equals(2234322344613),
      );
      expect(
        bill.findByBarcode('22343223446130001070189')[1],
        equals(1070189),
      );
    }); // test 'test findByBarcode method from the given barcode'

    test('test call method', () {
      var bill = Bill(billId: 9174639504124, paymentId: 12908197);
      expect(
          bill(),
          equals({
            'amount': 12900,
            'type': 'برق',
            'barcode': '917463950412400012908197',
            'isBillValid': false,
            'isBillIdValid': true,
            'isPaymentIdValid': false,
          }));
    }); // test 'test call method'
  });
}
