import 'package:dalel/core/widgets/custom_card_item.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodsCards extends StatelessWidget {
  const HistoricalPeriodsCards({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [CustomCardItem(), CustomCardItem()],
    );
  }
}
