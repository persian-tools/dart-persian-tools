import 'package:persian_tools/persian_tools.dart';
import 'package:persian_tools/src/core/vehicle_plate/helper_classes.dart';
import 'package:persian_tools/src/core/vehicle_plate/helper_methods.dart';
import 'package:test/test.dart';

void main() {
  group('test vehicle_plate/classes', () {
    test('test Plate class info property', () {
      var plate = Plate(plate: '121454789');
      expect(() => plate.info, throwsException);

      plate = Plate(plate: '12ب14547');
      expect(plate.info, isA<PlateInfo>());
      expect(plate.isValid, isA<bool>());

      plate = Plate(plate: '12345678');
      expect(plate.info.type, 'Motorcycle');
      expect(plate.isValid, true);
    });
  });
  group('test vehicle_plate/helper_*', () {
    test('test getPlateHandler method', () {
      // should returns carHandler for length 7
      var normalizedPlate = NormalizedPlate('1214547', 'ب');
      expect(getPlateHandler(normalizedPlate), carHandler);

      // should returns motorcycleHandler for length 8
      normalizedPlate = NormalizedPlate('12145478');
      expect(getPlateHandler(normalizedPlate), motorcycleHandler);

      // should throw exception for not recognized lengths
      normalizedPlate = NormalizedPlate('6515614525');
      expect(() => getPlateHandler(normalizedPlate), throwsException);
      normalizedPlate = NormalizedPlate('165', 'الف');
      expect(() => getPlateHandler(normalizedPlate), throwsException);
    });

    group('test handlers', () {
      test('test carHandler method', () {
        var _iran = 'ایران';
        // complete normalized plate
        var normalizedPlate = NormalizedPlate('1214547', 'ب');
        var plateInfo = carHandler(normalizedPlate);
        var template = '12${normalizedPlate.char}145${_iran}47';
        expect(plateInfo.type, 'Car');
        expect(plateInfo.template, template);
        expect(plateInfo.province, 'مرکزی');
        expect(plateInfo.category, 'شخصی');

        // incomplete normalized plate
        normalizedPlate = NormalizedPlate('1214501');
        plateInfo = carHandler(normalizedPlate);
        template = '12null145${_iran}1';
        expect(plateInfo.type, 'Car');
        expect(plateInfo.template, template);
        expect(plateInfo.province, null);
        expect(plateInfo.category, null);
      });

      test('test motorcycleHandler method', () {
        // with available province code
        var normalizedPlate = NormalizedPlate('12145478');
        var plateInfo = motorcycleHandler(normalizedPlate);
        expect(plateInfo.type, 'Motorcycle');
        expect(plateInfo.template, '121-45478');
        expect(plateInfo.province, 'مرکز تهران');
        expect(plateInfo.category, null);

        // with fake province code
        normalizedPlate = NormalizedPlate('10045118');
        plateInfo = motorcycleHandler(normalizedPlate);
        expect(plateInfo.type, 'Motorcycle');
        expect(plateInfo.template, '100-45118');
        expect(plateInfo.province, null);
        expect(plateInfo.category, null);
      });
    });

    group('test isPlateValid method', () {
      test('test isPlateValid for car plates', () {
        var _iran = 'ایران';
        // complete car plate
        var normalizedPlate = NormalizedPlate('1214547', 'ب');
        var _char = 'ب';
        var template = '12${_char}145${_iran}47';
        var plateInfo = PlateInfo(
          type: 'Car',
          template: template,
          province: 'مرکزی',
          category: 'شخصی',
        );
        expect(isPlateValid(plateInfo, normalizedPlate), true);

        // incomplete car plate
        normalizedPlate = NormalizedPlate('1214501');
        template = '12null145${_iran}47';
        plateInfo = PlateInfo(
          type: 'Car',
          template: template,
          province: null,
          category: null,
        );
        expect(isPlateValid(plateInfo, normalizedPlate), false);

        // incomplete car plate - undefined plate char
        normalizedPlate = NormalizedPlate('1245147', 'g');
        template = '12g451${_iran}47';
        plateInfo = PlateInfo(
          type: 'Car',
          template: template,
          province: 'مرکزی',
          category: null,
        );
        expect(isPlateValid(plateInfo, normalizedPlate), false);

        // incomplete car plate - undefined province code
        normalizedPlate = NormalizedPlate('1245150', 'الف');
        template = '12${normalizedPlate.char}451${_iran}50';
        plateInfo = PlateInfo(
          type: 'Car',
          template: template,
          province: null,
          category: 'دولتی',
        );
        expect(isPlateValid(plateInfo, normalizedPlate), false);
      });

      test('test isPlateValid for motorcycle plates', () {
        // complete motorcycle plate
        var normalizedPlate = NormalizedPlate('12145478');
        var plateInfo = PlateInfo(
          type: 'Motorcycle',
          template: '121-45478',
          province: 'مرکز تهران',
          category: null,
        );
        expect(isPlateValid(plateInfo, normalizedPlate), true);

        // incomplete motorcycle plate - undefined province code
        normalizedPlate = NormalizedPlate('10045118');
        plateInfo = PlateInfo(
          type: 'Motorcycle',
          template: '100-45118',
          province: null,
          category: null,
        );
        expect(isPlateValid(plateInfo, normalizedPlate), false);

        // incomplete motorcycle plate - undefined province code
        normalizedPlate = NormalizedPlate('10045678');
        plateInfo = PlateInfo(
          type: 'Motorcycle',
          template: '100-45678',
          province: null,
          category: null,
        );
        expect(isPlateValid(plateInfo, normalizedPlate), false);
      });
    });

    group('test getPlateInfo method', () {
      test('test getPlateInfo method for car plates', () {
        var _iran = 'ایران';
        var normalizedPlate = NormalizedPlate('1214547', 'ب');
        var template = '12${normalizedPlate.char}145${_iran}47';
        var plateInfo = getPlateInfo(normalizedPlate);
        expect(plateInfo.type, 'Car');
        expect(plateInfo.template, template);
        expect(plateInfo.province, 'مرکزی');
        expect(plateInfo.category, 'شخصی');
      });

      test('test getPlateInfo method for motorcycle plates', () {
        var normalizedPlate = NormalizedPlate('12145478');
        var plateInfo = getPlateInfo(normalizedPlate);
        expect(plateInfo.type, 'Motorcycle');
        expect(plateInfo.template, '121-45478');
        expect(plateInfo.province, 'مرکز تهران');
        expect(plateInfo.category, null);
      });
    });

    test('test normalizePlate method', () {
      // car plate - with char
      var normalizedPlate = normalizePlate('12الف34567');
      expect(normalizedPlate.numbers, '1234567');
      expect(normalizedPlate.char, 'الف');

      // car plate - without char
      normalizedPlate = normalizePlate('1234567');
      expect(normalizedPlate.numbers, '1234567');
      expect(normalizedPlate.char, null);

      // motorcycle plate
      normalizedPlate = normalizePlate('12345678');
      expect(normalizedPlate.numbers, '12345678');
      expect(normalizedPlate.char, null);
    });

    test('test isPlateNumberValid method', () {
      // car plates
      expect(isPlateNumberValid('1234560'), true);
      expect(isPlateNumberValid('1230567'), false);
      expect(isPlateNumberValid('1ی23456'), false);
      expect(isPlateNumberValid('1234f560'), false);
      expect(isPlateNumberValid('123450d0'), false);

      // motorcycle plates
      expect(isPlateNumberValid('12345670'), true);
      expect(isPlateNumberValid('12345678'), true);
      expect(isPlateNumberValid('12305678'), false);
    });
  });
}
