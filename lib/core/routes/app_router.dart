import 'package:dalel/features/home/presentation/views/onboarding_view.dart';
import 'package:dalel/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> buildAppRoutes() {
  return {
    '/onboardingview': (context) => const OnboardingView(),
    '/splashview': (context) => const SplashView(),
  };
}
