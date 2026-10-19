import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

/// Round button that swaps the From and To units, with a small spin animation.
class SwapButton extends StatefulWidget {
  const SwapButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<SwapButton> createState() => _SwapButtonState();
}

class _SwapButtonState extends State<SwapButton> {
  double _turns = 0;

  void _handleTap() {
    setState(() => _turns += 0.5);
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary,
      shape: const CircleBorder(),
      elevation: 4,
      shadowColor: AppColors.primary,
      child: InkWell(
        key: const Key('swap_button'),
        customBorder: const CircleBorder(),
        onTap: _handleTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: AnimatedRotation(
            turns: _turns,
            duration: const Duration(milliseconds: 300),
            child: const Icon(Icons.swap_vert_rounded,
                color: Colors.white, size: 28),
          ),
        ),
      ),
    );
  }
}
