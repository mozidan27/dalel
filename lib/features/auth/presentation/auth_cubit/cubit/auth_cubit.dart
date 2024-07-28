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
  GlobalKey<FormState> signinFormKey = GlobalKey();
  GlobalKey<FormState> resetPasswordFormKey = GlobalKey();

  // sign up method
  signUpWithEmailAndPassword() async {
    try {
      emit(SignupLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      verfiyEmail();
      emit(SignupSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignupFailurState(
            errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignupFailurState(
            errorMessage: 'The account already exists for that email.'));
      } else if (e.code == 'invalid-email') {
        emit(SignupFailurState(errorMessage: 'The email is invalid.'));
      } else {
        emit(SignupFailurState(errorMessage: e.code));
      }
    } catch (e) {
      emit(SignupFailurState(errorMessage: e.toString()));
    }
  }

  verfiyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

// sign in method
  signInWithEmailAndPassword() async {
    try {
      emit(SigninLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress!, password: password!);
      emit(SigninSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SigninFailurState(errorMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SigninFailurState(
            errorMessage: 'Wrong password provided for that user.'));
      } else {
        emit(SigninFailurState(errorMessage: 'Check your email and password!'));
      }
    } catch (e) {
      emit(SigninFailurState(errorMessage: e.toString()));
    }
  }

// update terms and condiditon method
  updateTermsAndConditionCheckBox({required newValue}) {
    termsAndConditionCheckBoxValue = newValue;
    emit(TermsAndConditionsUpdateState());
  }

// obscure password text method
  void obscurePasswordText() {
    obscurePasswordTextValue == true
        ? obscurePasswordTextValue = false
        : obscurePasswordTextValue = true;
    emit(ObscurePasswordTextUpdateState());
  }

  // sign out method
  signOut() {
    FirebaseAuth.instance.signOut();
  }

// reset password

  resetPasswordWithLink() async {
    try {
      emit(PasswordRestLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
      emit(PasswordRestSuccessState());
    } on Exception catch (e) {
      emit(PasswordRestFailurState(errorMessage: e.toString()));
    }
  }
}
