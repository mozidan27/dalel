import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_header_text.dart';
import 'package:dalel/features/home/presentation/widgets/historical_characters_card.dart';
import 'package:flutter/material.dart';

class HistoricalCharacterScetion extends StatelessWidget {
  const HistoricalCharacterScetion({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(text: AppStrings.historicalCharacters),
        SizedBox(height: 16),
        HistoricalCharactersCard(),
        SizedBox(height: 32),
      ],
    );
  }
}
