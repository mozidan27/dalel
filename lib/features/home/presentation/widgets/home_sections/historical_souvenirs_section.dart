import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_header_text.dart';
import 'package:dalel/features/home/presentation/widgets/historical_souvenirs_card.dart';
import 'package:flutter/material.dart';

class HistoricalSouvenirSection extends StatelessWidget {
  const HistoricalSouvenirSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(text: AppStrings.historicalSouvenirs),
        SizedBox(height: 16),
        HistoricalSouvenirsCard(),
        SizedBox(height: 40),
      ],
    );
  }
}
