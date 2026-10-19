import 'unit_category.dart';

/// Every unit the app can convert between.
enum Unit {
  meter(label: 'Meter', symbol: 'm', category: UnitCategory.length),
  kilometer(label: 'Kilometer', symbol: 'km', category: UnitCategory.length),
  gram(label: 'Gram', symbol: 'g', category: UnitCategory.weight),
  kilogram(label: 'Kilogram', symbol: 'kg', category: UnitCategory.weight),
  celsius(label: 'Celsius', symbol: '°C', category: UnitCategory.temperature),
  fahrenheit(
      label: 'Fahrenheit', symbol: '°F', category: UnitCategory.temperature);

  const Unit({
    required this.label,
    required this.symbol,
    required this.category,
  });

  /// Display name, e.g. "Kilometer".
  final String label;

  /// Short symbol, e.g. "km".
  final String symbol;

  /// Category this unit belongs to.
  final UnitCategory category;
}
