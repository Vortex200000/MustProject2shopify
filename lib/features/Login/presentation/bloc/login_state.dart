part of 'login_bloc.dart';

enum ScreenState { Init, LoginError, LoginSuccess, Loading }

@immutable
class LoginState {
  ScreenState? screenState;

  LoginEntity? loginEntity;

  Failures? failures;

  LoginState({this.screenState, this.loginEntity, this.failures});

  LoginState CopyWith(
      {ScreenState? state1, LoginEntity? login, Failures? loginfail}) {
    return LoginState(
        screenState: state1 ?? screenState,
        loginEntity: login ?? loginEntity,
        failures: loginfail ?? failures);
  }
}

class LoginInitial extends LoginState {
  LoginInitial() : super(screenState: ScreenState.Init);
}
