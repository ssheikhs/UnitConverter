import 'unit.dart';

/// The three categories supported by the converter.
enum UnitCategory {
  length(label: 'Length'),
  weight(label: 'Weight'),
  temperature(label: 'Temp');

  const UnitCategory({required this.label});

  /// Short label shown on the category tabs.
  final String label;

  /// All units that belong to this category.
  List<Unit> get units => Unit.values.where((u) => u.category == this).toList();
}
