class AuthState {}

final class AuthInitial extends AuthState {}

final class SignupLoadingState extends AuthState {}

final class SignupSuccessState extends AuthState {}

final class SignupFailurState extends AuthState {
  final String errorMessage;

  SignupFailurState({required this.errorMessage});
}

final class TermsAndConditionsUpdateState extends AuthState {}

final class ObscurePasswordTextUpdateState extends AuthState {}
