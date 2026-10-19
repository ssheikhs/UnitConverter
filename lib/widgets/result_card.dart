import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

/// Shows the converted value in large text plus a readable summary line.
class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
    required this.value,
    required this.symbol,
    this.summary,
  });

  final String value;
  final String symbol;
  final String? summary;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Result:',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
          ),
          const Divider(height: 20, color: AppColors.border),
          Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text.rich(
                key: const Key('result_value'),
                TextSpan(
                  children: [
                    TextSpan(
                      text: value,
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    TextSpan(
                      text: ' $symbol',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (summary != null) ...[
            const SizedBox(height: 8),
            Center(
              child: Text(
                summary!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
