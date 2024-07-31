import 'package:dalel/features/home/presentation/widgets/cusotm_home_appbar.dart';
import 'package:flutter/material.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 70),
        CustomHomeViewAppBar(),
        SizedBox(height: 32),
      ],
    );
  }
}
