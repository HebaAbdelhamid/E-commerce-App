abstract class SignUpSate{}
class InitialState extends SignUpSate{}
class CheckeState extends SignUpSate{}
class SuccessSignUpState extends SignUpSate{}
class ErrorSignUpState extends SignUpSate{
  String?message;
  ErrorSignUpState(this.message);

}
