import 'package:dalel/core/funcations/navigation.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/home/data/models/on_boarding_model.dart';
import 'package:flutter/material.dart';

class GetButtons extends StatelessWidget {
  const GetButtons(
      {super.key, required this.currentIndex, required this.controller});
  final int currentIndex;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return currentIndex == onBoardingData.length - 1
        ? Column(
            children: [
              CustomButton(
                text: AppStrings.createAccount,
                onTap: () {
                  customReplacementNavigate(context, '/signup');
                },
              ),
              const SizedBox(height: 35),
              GestureDetector(
                onTap: () {
                  customReplacementNavigate(context, '/signin');
                },
                child: Text(AppStrings.loginNow,
                    style: CustomTextStyles.poppins400style12
                        .copyWith(fontSize: 16)),
              )
            ],
          )
        : CustomButton(
            text: AppStrings.next,
            color: AppColors.primaryColor,
            onTap: () {
              controller.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.bounceInOut);
            },
          );
  }
}
