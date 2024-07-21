import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dalel/features/auth/presentation/widgets/terms_and_condition_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
            child: Column(
          children: [
            CustomTextFormFieldWidget(
              text: AppStrings.fristName,
              onChanged: (firstName) {
                BlocProvider.of<AuthCubit>(context).firstName = firstName;
              },
            ),
            CustomTextFormFieldWidget(
              text: AppStrings.lastName,
              onChanged: (lastName) {
                BlocProvider.of<AuthCubit>(context).lastName = lastName;
              },
            ),
            CustomTextFormFieldWidget(
              text: AppStrings.emailAddress,
              onChanged: (email) {
                BlocProvider.of<AuthCubit>(context).emailAddress = email;
              },
            ),
            CustomTextFormFieldWidget(
              text: AppStrings.password,
              onChanged: (password) {
                BlocProvider.of<AuthCubit>(context).password = password;
              },
            ),
            const SizedBox(height: 16),
            const TermsAndConditions(
                text1: AppStrings.iHaveAgreeToOur,
                text2: AppStrings.termsAndCondition),
            const SizedBox(height: 88),
            CustomButton(
                text: AppStrings.signUp,
                onTap: () {
                  BlocProvider.of<AuthCubit>(context)
                      .signUpWithEmailAndPassword();
                }),
          ],
        ));
      },
    );
  }
}
