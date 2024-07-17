import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/home/presentation/widgets/custom_nav_bar.dart';
import 'package:dalel/features/home/presentation/widgets/on_boarding_view_widget.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              // skip text
              const CustomNavBar(),
              // pic
              OnBoardingWidgetBody(),
              //custombutton
              CustomButton(
                text: AppStrings.next,
                color: AppColors.primaryColor,
                onTap: () {},
              ),
              const SizedBox(
                height: 36,
              )
            ],
          ),
        ),
      ),
    );
  }
}
