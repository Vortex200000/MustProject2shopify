part of 'sign_up_bloc.dart';

enum SignUpScreenState { loading, init, SignUpError, SignUpSuccess }

@immutable
class SignUpState {
  SignUpScreenState? signUpScreenState;
  Failures? signUpFail;
  SignUpEntity? signUpEntity;

  SignUpState({this.signUpScreenState, this.signUpFail, this.signUpEntity});

  SignUpState CopyWith({SignUpScreenState? signUppScreenState1,
    Failures? SignfAIL,
    SignUpEntity? signUpEntityy}) {
    return SignUpState(
        signUpEntity: signUpEntityy ?? signUpEntity,
        signUpFail: SignfAIL ?? signUpFail,
        signUpScreenState: signUppScreenState1 ?? signUpScreenState);
  }
}

class SignUpInitial extends SignUpState {

  SignUpInitial() :super(
      signUpScreenState: SignUpScreenState.init
  );
}
