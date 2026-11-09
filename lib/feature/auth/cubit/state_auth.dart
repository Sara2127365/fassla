

abstract class AuthState {}

class InitialState extends AuthState {}

class LoadingSignUpState extends AuthState {}

class SuccessSignUpState extends AuthState {
  final String message;

  SuccessSignUpState({required this.message});
}

class ErrorSignUpState extends AuthState {
  final String message;

  ErrorSignUpState({required this.message});
}

class LoadingSignInState extends AuthState {}

class SuccessSignInState extends AuthState {
   final String message;

  SuccessSignInState({required this.message});

}

class ErrorSignInState extends AuthState {
   final String message;

  ErrorSignInState({required this.message});

}


class LoadingForgetPasswordState extends AuthState {}

class SuccessForgetPasswordState extends AuthState {
   final String message;

  SuccessForgetPasswordState({required this.message});

}

class ErrorForgetPasswordState extends AuthState {
   final String message;

  ErrorForgetPasswordState({required this.message});

}

