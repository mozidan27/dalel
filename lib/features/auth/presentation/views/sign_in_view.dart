import 'package:dalel/core/funcations/navigation.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_signin_form.dart';
import 'package:dalel/features/auth/presentation/widgets/have_an_account.dart';
import 'package:dalel/features/auth/presentation/widgets/welcome_banner.dart';
import 'package:dalel/features/auth/presentation/widgets/welcome_text.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: WelcomeBanner(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 32,
            ),
          ),
          const SliverToBoxAdapter(
            child: WelcomeTextWidget(text: AppStrings.welcomeBack),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 48,
            ),
          ),
          const SliverToBoxAdapter(
            child: CustomSignInForm(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverToBoxAdapter(
            child: HaveAnAccount(
              text1: AppStrings.dontHaveAnAccount,
              text2: AppStrings.signUp,
              onTap: () {
                customReplacementNavigate(context, '/signup');
              },
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
        ],
      ),
    );
  }
}
