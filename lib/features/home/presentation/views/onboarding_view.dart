import 'package:dalel/features/home/presentation/widgets/custom_nav_bar.dart';
import 'package:dalel/features/home/presentation/widgets/get_buttons.dart';
import 'package:dalel/features/home/presentation/widgets/on_boarding_view_widget.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(
                height: 40,
              ),
              // skip text
              const CustomNavBar(),
              // pic
              OnBoardingWidgetBody(
                controller: _controller,
                onPageChanged: (index) {
                  setState(
                    () {
                      currentIndex = index;
                    },
                  );
                },
              ),
              const SizedBox(
                height: 88,
              ),
              //custombutton
              GetButtons(currentIndex: currentIndex, controller: _controller),
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
