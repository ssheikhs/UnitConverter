import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/theme/app_colors.dart';
import '../providers/converter_provider.dart';
import '../widgets/category_selector.dart';
import '../widgets/result_card.dart';
import '../widgets/section_label.dart';
import '../widgets/swap_button.dart';
import '../widgets/unit_dropdown.dart';
import '../widgets/value_input_field.dart';

class ConverterScreen extends StatelessWidget {
  const ConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConverterProvider>();

    return GestureDetector(
      // Tap outside the field to hide the keyboard.
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Unit Converter')),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CategorySelector(
                  selected: provider.category,
                  onChanged: provider.setCategory,
                ),
                const SizedBox(height: 24),

                const SectionLabel('Enter Value'),
                ValueInputField(
                  onChanged: provider.setInput,
                  errorText: provider.hasInput && !provider.isInputValid
                      ? 'Please enter a valid number'
                      : null,
                ),
                const SizedBox(height: 20),

                const SectionLabel('From'),
                UnitDropdown(
                  key: const Key('from_dropdown'),
                  value: provider.fromUnit,
                  units: provider.availableUnits,
                  onChanged: provider.setFromUnit,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      const Expanded(child: Divider(color: AppColors.border)),
                      const SizedBox(width: 12),
                      SwapButton(onPressed: provider.swapUnits),
                      const SizedBox(width: 12),
                      const Expanded(child: Divider(color: AppColors.border)),
                    ],
                  ),
                ),

                const SectionLabel('To'),
                UnitDropdown(
                  key: const Key('to_dropdown'),
                  value: provider.toUnit,
                  units: provider.availableUnits,
                  onChanged: provider.setToUnit,
                ),
                const SizedBox(height: 28),

                ResultCard(
                  value: provider.formattedResult,
                  symbol: provider.toUnit.symbol,
                  summary: provider.summary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
