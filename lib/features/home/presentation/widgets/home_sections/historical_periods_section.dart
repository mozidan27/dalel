import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_header_text.dart';
import 'package:dalel/features/home/presentation/widgets/historical_periods_card.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodSection extends StatelessWidget {
  const HistoricalPeriodSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(text: AppStrings.historicalPeriods),
        SizedBox(height: 16),
        HistoricalPeriodsCards(),
        SizedBox(height: 32),
      ],
    );
  }
}
