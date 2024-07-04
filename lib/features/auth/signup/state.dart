abstract class SignUpSate {}

class InitialState extends SignUpSate {}

class CheckeState extends SignUpSate {}

class SuccessSignUpState extends SignUpSate {}

class SignupError extends SignUpSate {}

class SignupSuccess extends SignUpSate {}

class SignupLoading extends SignUpSate {}

class ErrorSignUpState extends SignUpSate {
  String? message;

  ErrorSignUpState(this.message);
}
