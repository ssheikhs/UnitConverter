import 'package:flutter_test/flutter_test.dart';
import 'package:unit_converter/logic/conversion_logic.dart';
import 'package:unit_converter/models/unit.dart';

void main() {
  group('Length', () {
    test('meter to kilometer', () {
      expect(ConversionLogic.convert(25, Unit.meter, Unit.kilometer), 0.025);
    });
    test('kilometer to meter (assignment example)', () {
      expect(ConversionLogic.convert(10, Unit.kilometer, Unit.meter), 10000);
    });
  });

  group('Weight', () {
    test('gram to kilogram', () {
      expect(ConversionLogic.convert(1500, Unit.gram, Unit.kilogram), 1.5);
    });
    test('kilogram to gram', () {
      expect(ConversionLogic.convert(2, Unit.kilogram, Unit.gram), 2000);
    });
  });

  group('Temperature', () {
    test('celsius to fahrenheit', () {
      expect(ConversionLogic.convert(100, Unit.celsius, Unit.fahrenheit), 212);
    });
    test('fahrenheit to celsius', () {
      expect(ConversionLogic.convert(32, Unit.fahrenheit, Unit.celsius), 0);
    });
  });

  test('same unit returns the same value', () {
    expect(ConversionLogic.convert(7, Unit.meter, Unit.meter), 7);
  });

  test('format removes trailing zeros', () {
    expect(ConversionLogic.format(10000), '10000');
    expect(ConversionLogic.format(0.025), '0.025');
    expect(ConversionLogic.format(37 * 9 / 5 + 32), '98.6');
  });
}
