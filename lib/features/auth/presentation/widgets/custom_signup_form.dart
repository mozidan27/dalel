import 'package:dalel/core/funcations/custom_toast.dart';
import 'package:dalel/core/funcations/navigation.dart';
import 'package:dalel/core/utils/app_colors.dart';
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
      listener: (context, state) {
        if (state is SignupSuccessState) {
          CusotmToast(
              meg: 'Successfully, Check your email to verfiy your account!');
          customReplacementNavigate(context, '/signin');
        } else if (state is SignupFailurState) {
          CusotmToast(meg: state.errorMessage);
        }
      },
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
                    suffixIcon: authCubit.obscurePasswordTextValue == true
                        ? IconButton(
                            onPressed: authCubit.obscurePasswordText,
                            icon: Icon(
                              Icons.visibility_outlined,
                              color: AppColors.grey,
                            ))
                        : IconButton(
                            onPressed: authCubit.obscurePasswordText,
                            icon: const Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.blue,
                            )),
                    text: AppStrings.password,
                    obscureText: authCubit.obscurePasswordTextValue!,
                    onChanged: (password) {
                      authCubit.password = password;
                    }),
                const SizedBox(height: 16),
                const TermsAndConditions(
                    text1: AppStrings.iHaveAgreeToOur,
                    text2: AppStrings.termsAndCondition),
                const SizedBox(height: 88),
                state is SignupLoadingState
                    ? CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )
                    : CustomButton(
                        color: authCubit.termsAndConditionCheckBoxValue == false
                            ? Colors.grey
                            : null,
                        text: AppStrings.signUp,
                        onTap: () {
                          if (authCubit.termsAndConditionCheckBoxValue ==
                              true) {
                            if (authCubit.signupFormKey.currentState!
                                .validate()) {
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
