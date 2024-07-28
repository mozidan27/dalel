import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_forgotpass_form.dart';
import 'package:dalel/features/auth/presentation/widgets/forgot_pass_subtitle.dart';
import 'package:dalel/features/auth/presentation/widgets/forgot_password_image.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView(
        children: [
          const SizedBox(
            height: 108,
          ),
          Center(
            child: Text(
              AppStrings.forgotPasswordPage,
              style: CustomTextStyles.poppins600style28.copyWith(fontSize: 24),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const ForgotPasswordImage(),
          const SizedBox(
            height: 24,
          ),
          const ForgotPassSubTitle(),
          const SizedBox(
            height: 41,
          ),
          const CustomForgotPasswordForm(),
          const SizedBox(
            height: 17,
          ),
        ],
      ),
    ));
  }
}
