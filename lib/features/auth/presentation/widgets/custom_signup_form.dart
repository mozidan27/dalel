import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dalel/features/auth/presentation/widgets/terms_and_condition_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignUpForm extends StatefulWidget {
  const CustomSignUpForm({super.key});

  @override
  State<CustomSignUpForm> createState() => _CustomSignUpFormState();
}

class _CustomSignUpFormState extends State<CustomSignUpForm> {
  bool securePassword = true;

  void visibility() {
    setState(() {
      securePassword = !securePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
            key: authCubit.signupFormKey,
            child: Column(
              children: [
                CustomTextFormFieldWidget(
                    obscureText: false,
                    text: AppStrings.fristName,
                    onChanged: (firstName) {
                      authCubit.firstName = firstName;
                    }),
                CustomTextFormFieldWidget(
                    obscureText: false,
                    text: AppStrings.lastName,
                    onChanged: (lastName) {
                      authCubit.lastName = lastName;
                    }),
                CustomTextFormFieldWidget(
                    obscureText: false,
                    text: AppStrings.emailAddress,
                    onChanged: (email) {
                      authCubit.emailAddress = email;
                    }),
                CustomTextFormFieldWidget(
                    obscureText: securePassword,
                    suffixIcon: securePassword
                        ? IconButton(
                            onPressed: visibility,
                            icon: const Icon(Icons.visibility_outlined))
                        : IconButton(
                            onPressed: visibility,
                            icon: const Icon(Icons.visibility_off_outlined)),
                    text: AppStrings.password,
                    onChanged: (password) {
                      authCubit.password = password;
                    }),
                const SizedBox(height: 16),
                const TermsAndConditions(
                    text1: AppStrings.iHaveAgreeToOur,
                    text2: AppStrings.termsAndCondition),
                const SizedBox(height: 88),
                CustomButton(
                    color: authCubit.termsAndConditionCheckBoxValue == false
                        ? Colors.grey
                        : null,
                    text: AppStrings.signUp,
                    onTap: () {
                      if (authCubit.termsAndConditionCheckBoxValue == true) {
                        if (authCubit.signupFormKey.currentState!.validate()) {
                          authCubit.signUpWithEmailAndPassword();
                        }
                      }
                    }),
              ],
            ));
      },
    );
  }
}
