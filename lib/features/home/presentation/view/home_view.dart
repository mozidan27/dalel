import 'package:dalel/features/home/presentation/widgets/home_sections/app_bar_section.dart';
import 'package:dalel/features/home/presentation/widgets/home_sections/historical_characters_section.dart';
import 'package:dalel/features/home/presentation/widgets/home_sections/historical_periods_section.dart';
import 'package:dalel/features/home/presentation/widgets/home_sections/historical_souvenirs_section.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: AppBarSection()),
            SliverToBoxAdapter(child: HistoricalPeriodSection()),
            SliverToBoxAdapter(child: HistoricalCharacterScetion()),
            SliverToBoxAdapter(child: HistoricalSouvenirSection()),
          ],
        ),
      ),
    );
  }
}
