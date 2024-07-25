import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/views/sign_in_view.dart';
import 'package:dalel/features/auth/presentation/views/sign_up_view.dart';
import 'package:dalel/features/home/presentation/view/home_view.dart';
import 'package:dalel/features/on_boarding/presentation/views/onboarding_view.dart';
import 'package:dalel/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Map<String, WidgetBuilder> buildAppRoutes() {
  return {
    '/onboardingview': (context) => const OnboardingView(),
    '/splashview': (context) => const SplashView(),
    '/signup': (context) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const SignUpView(),
        ),
    '/signin': (context) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const SignInView(),
        ),
    '/homeview': (context) => const HomeView(),
  };
}
