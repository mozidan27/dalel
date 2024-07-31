import 'package:dalel/core/widgets/virtical_custom_card_item.dart';
import 'package:flutter/material.dart';

class HistoricalCharactersCard extends StatelessWidget {
  const HistoricalCharactersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 133,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          separatorBuilder: (context, index) {
            return const SizedBox(width: 16);
          },
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const VirticalCustomCard();
          },
          itemCount: 10),
    );
  }
}
