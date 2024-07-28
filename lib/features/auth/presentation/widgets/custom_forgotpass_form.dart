import 'package:dalel/core/funcations/custom_toast.dart';
import 'package:dalel/core/funcations/navigation.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomForgotPasswordForm extends StatelessWidget {
  const CustomForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is PasswordRestSuccessState) {
          CusotmToast(meg: 'Check your email to reset your password');
          customReplacementNavigate(context, '/signin');
        } else if (state is PasswordRestFailurState) {
          CusotmToast(meg: state.errorMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.resetPasswordFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                CustomTextFormFieldWidget(
                    obscureText: false,
                    text: AppStrings.emailAddress,
                    onChanged: (email) {
                      authCubit.emailAddress = email;
                    }),
                const SizedBox(height: 102),
                state is SigninLoadingState
                    ? CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )
                    : CustomButton(
                        onTap: () {
                          if (authCubit.resetPasswordFormKey.currentState!
                              .validate()) {
                            authCubit.resetPasswordWithLink();
                          }
                        },
                        text: AppStrings.sendResetPasswordLink,
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
