import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../models/unit.dart';

/// Dropdown used for both "From" and "To" units.
class UnitDropdown extends StatelessWidget {
  const UnitDropdown({
    super.key,
    required this.value,
    required this.units,
    required this.onChanged,
  });

  final Unit value;
  final List<Unit> units;
  final ValueChanged<Unit> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Unit>(
          value: value,
          isExpanded: true,
          borderRadius: BorderRadius.circular(12),
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
          items: units
              .map(
                (unit) => DropdownMenuItem<Unit>(
                  value: unit,
                  child: Text('${unit.label} (${unit.symbol})'),
                ),
              )
              .toList(),
          onChanged: (unit) {
            if (unit != null) onChanged(unit);
          },
        ),
      ),
    );
  }
}
