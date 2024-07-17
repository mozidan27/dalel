import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/home/presentation/widgets/custom_smooth_page_indecator.dart';
import 'package:flutter/material.dart';

class OnBoardingWidgetBody extends StatelessWidget {
  OnBoardingWidgetBody({super.key});
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: _controller,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.asset(Assets.imagesOnboarding1),
              const SizedBox(
                height: 24,
              ),
              CustomSmoothPageIndecator(controller: _controller),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Explore The history with Dalel in a smart way',
                style: CustomTextStyles.poppins500style24
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Using our app’s history libraries you can find many historical periods ',
                style: CustomTextStyles.poppins300style16,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 88,
              ),
            ],
          );
        },
      ),
    );
  }
}
