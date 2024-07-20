import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dalel/features/auth/presentation/widgets/have_an_account.dart';
import 'package:dalel/features/auth/presentation/widgets/terms_and_condition_widget.dart';
import 'package:dalel/features/auth/presentation/widgets/welcome_text.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(height: 152),
            ),
            const SliverToBoxAdapter(
              child: WelcomeTextWidget(text: AppStrings.welcome),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 16),
            ),
            const SliverToBoxAdapter(
              child: CustomTextFieldWidget(
                text: AppStrings.fristName,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomTextFieldWidget(
                text: AppStrings.lastName,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomTextFieldWidget(
                text: AppStrings.emailAddress,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomTextFieldWidget(
                text: AppStrings.password,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 16),
            ),
            const SliverToBoxAdapter(
              child: TermsAndConditions(
                text1: AppStrings.iHaveAgreeToOur,
                text2: AppStrings.termsAndCondition,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 88),
            ),
            SliverToBoxAdapter(
              child: CustomButton(
                text: AppStrings.signUp,
                onTap: () {},
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 16),
            ),
            const SliverToBoxAdapter(
              child: HaveAnAccount(
                  text1: AppStrings.alreadyHaveAnAccount,
                  text2: AppStrings.signIn),
            )
          ],
        ),
      ),
    );
  }
}
