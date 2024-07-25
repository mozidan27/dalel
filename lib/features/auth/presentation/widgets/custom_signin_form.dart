import 'package:dalel/core/funcations/custom_toast.dart';
import 'package:dalel/core/funcations/navigation.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dalel/features/auth/presentation/widgets/forgot_password_text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SigninSuccessState) {
          CusotmToast(meg: 'Welcome Back!');
          FirebaseAuth.instance.currentUser!.emailVerified
              ? customReplacementNavigate(context, '/homeview')
              : CusotmToast(meg: 'Please verify your account');
        } else if (state is SigninFailurState) {
          CusotmToast(meg: state.errorMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signinFormKey,
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
                const SizedBox(
                  height: 25,
                ),
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
                const ForgotPasswordTextWidget(),
                const SizedBox(height: 102),
                state is SigninLoadingState
                    ? CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )
                    : CustomButton(
                        onTap: () {
                          if (authCubit.signinFormKey.currentState!
                              .validate()) {
                            authCubit.signInWithEmailAndPassword();
                          }
                        },
                        text: AppStrings.signIn,
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
