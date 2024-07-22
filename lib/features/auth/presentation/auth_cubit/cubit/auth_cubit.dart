import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String? lastName;
  String? emailAddress;
  String? firstName;
  String? password;
  bool? termsAndConditionCheckBoxValue = false;
  bool? obscurePasswordTextValue = true;
  GlobalKey<FormState> signupFormKey = GlobalKey();
  signUpWithEmailAndPassword() async {
    try {
      emit(SignupLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignupSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignupFailurState(
            errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignupFailurState(
            errorMessage: 'The account already exists for that email.'));
      }
    } catch (e) {
      emit(SignupFailurState(errorMessage: e.toString()));
    }
  }

  updateTermsAndConditionCheckBox({required newValue}) {
    termsAndConditionCheckBoxValue = newValue;
    emit(TermsAndConditionsUpdateState());
  }

  void obscurePasswordText() {
    obscurePasswordTextValue == true
        ? obscurePasswordTextValue = false
        : obscurePasswordTextValue = true;
    emit(ObscurePasswordTextUpdateState());
  }
}
