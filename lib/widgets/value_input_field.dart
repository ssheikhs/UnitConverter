import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/theme/app_colors.dart';

/// Numeric input. Calls [onChanged] on every keystroke for real-time results.
class ValueInputField extends StatefulWidget {
  const ValueInputField({
    super.key,
    required this.onChanged,
    this.errorText,
  });

  final ValueChanged<String> onChanged;
  final String? errorText;

  @override
  State<ValueInputField> createState() => _ValueInputFieldState();
}

class _ValueInputFieldState extends State<ValueInputField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _clear() {
    _controller.clear();
    widget.onChanged('');
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('value_input'),
      controller: _controller,
      onChanged: widget.onChanged,
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
        signed: true,
      ),
      // Allows: optional minus, digits, one decimal point.
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*')),
      ],
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      ),
      decoration: InputDecoration(
        hintText: 'e.g. 25',
        errorText: widget.errorText,
        suffixIcon: ValueListenableBuilder<TextEditingValue>(
          valueListenable: _controller,
          builder: (context, value, _) {
            if (value.text.isEmpty) return const SizedBox.shrink();
            return IconButton(
              icon: const Icon(Icons.close, size: 20),
              color: AppColors.textSecondary,
              onPressed: _clear,
            );
          },
        ),
      ),
    );
  }
}
