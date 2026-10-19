import 'package:flutter/foundation.dart';

import '../logic/conversion_logic.dart';
import '../models/unit.dart';
import '../models/unit_category.dart';

/// Holds the converter state and recalculates the result in real time.
class ConverterProvider extends ChangeNotifier {
  UnitCategory _category = UnitCategory.length;
  Unit _fromUnit = Unit.meter;
  Unit _toUnit = Unit.kilometer;
  String _input = '';

  UnitCategory get category => _category;
  Unit get fromUnit => _fromUnit;
  Unit get toUnit => _toUnit;
  String get input => _input;

  /// Units available for the selected category (used by both dropdowns).
  List<Unit> get availableUnits => _category.units;

  /// Parsed input, or null when the field is empty / invalid.
  double? get inputValue => double.tryParse(_input.trim());

  bool get hasInput => _input.trim().isNotEmpty;
  bool get isInputValid => inputValue != null;

  /// Converted value, or null when there is nothing valid to convert.
  double? get result {
    final value = inputValue;
    if (value == null) return null;
    return ConversionLogic.convert(value, _fromUnit, _toUnit);
  }

  /// Result as display text, e.g. "10000".
  String get formattedResult {
    final value = result;
    return value == null ? '0' : ConversionLogic.format(value);
  }

  /// Readable summary, e.g. "10 Kilometer = 10000 Meter".
  String? get summary {
    final value = inputValue;
    if (value == null) return null;
    return '${ConversionLogic.format(value)} ${_fromUnit.label} = '
        '$formattedResult ${_toUnit.label}';
  }

  void setCategory(UnitCategory category) {
    if (category == _category) return;
    _category = category;
    final units = category.units;
    _fromUnit = units.first;
    _toUnit = units.last;
    notifyListeners();
  }

  void setInput(String value) {
    _input = value;
    notifyListeners();
  }

  void setFromUnit(Unit unit) {
    if (unit == _fromUnit) return;
    // Picking the same unit on both sides just swaps them.
    if (unit == _toUnit) _toUnit = _fromUnit;
    _fromUnit = unit;
    notifyListeners();
  }

  void setToUnit(Unit unit) {
    if (unit == _toUnit) return;
    if (unit == _fromUnit) _fromUnit = _toUnit;
    _toUnit = unit;
    notifyListeners();
  }

  void swapUnits() {
    final temp = _fromUnit;
    _fromUnit = _toUnit;
    _toUnit = temp;
    notifyListeners();
  }
}
