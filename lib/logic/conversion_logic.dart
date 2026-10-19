import '../models/unit.dart';

/// Pure conversion logic. No Flutter imports, so it is easy to unit test.
class ConversionLogic {
  ConversionLogic._();

  // ---------------- Length ----------------
  static double meterToKilometer(double meter) => meter / 1000;
  static double kilometerToMeter(double kilometer) => kilometer * 1000;

  // ---------------- Weight ----------------
  static double gramToKilogram(double gram) => gram / 1000;
  static double kilogramToGram(double kilogram) => kilogram * 1000;

  // ---------------- Temperature ----------------
  static double celsiusToFahrenheit(double celsius) => (celsius * 9 / 5) + 32;
  static double fahrenheitToCelsius(double fahrenheit) =>
      (fahrenheit - 32) * 5 / 9;

  /// Converts [value] from [from] unit to [to] unit.
  ///
  /// Both units must belong to the same category.
  static double convert(double value, Unit from, Unit to) {
    if (from.category != to.category) {
      throw ArgumentError('Cannot convert ${from.label} to ${to.label}');
    }
    if (from == to) return value;

    switch (from) {
      case Unit.meter:
        return meterToKilometer(value);
      case Unit.kilometer:
        return kilometerToMeter(value);
      case Unit.gram:
        return gramToKilogram(value);
      case Unit.kilogram:
        return kilogramToGram(value);
      case Unit.celsius:
        return celsiusToFahrenheit(value);
      case Unit.fahrenheit:
        return fahrenheitToCelsius(value);
    }
  }

  /// Formats a number nicely: no trailing zeros, max 6 decimal places.
  /// 10000.0 -> "10000", 0.025 -> "0.025", 98.60000000001 -> "98.6"
  static String format(double value) {
    if (value == value.roundToDouble() && value.abs() < 1e15) {
      return value.toInt().toString();
    }
    var text = value.toStringAsFixed(6);
    text = text.replaceFirst(RegExp(r'0+$'), '');
    text = text.replaceFirst(RegExp(r'\.$'), '');
    return text == '-0' ? '0' : text;
  }
}
