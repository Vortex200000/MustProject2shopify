import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mustproject2shopify2/core/API/API_Manager.dart';
import 'package:mustproject2shopify2/core/error/remote_error.dart';
import 'package:mustproject2shopify2/features/Login/data/Model/LoginRequestModel.dart';
import 'package:mustproject2shopify2/features/Login/data/local/data_sources/local_ds.dart';
import 'package:mustproject2shopify2/features/Login/data/local/data_sources/local_ds_impl.dart';
import 'package:mustproject2shopify2/features/Login/data/remote/data_sources/LoginRemoteDs.dart';
import 'package:mustproject2shopify2/features/Login/data/repository/LoginRepoImpl.dart';
import 'package:mustproject2shopify2/features/Login/domain/Entites/LoginEntity.dart';
import 'package:mustproject2shopify2/features/Login/domain/repository/LoginRepo.dart';

import '../../data/remote/data_sources/LoginRemoteDsImpl.dart';
import '../../domain/Login_Use_Cases/Login_usecase.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  static LoginBloc get(context) => BlocProvider.of(context);



  var EmailController = TextEditingController();
  var PassController = TextEditingController();

  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is SignInBtnClicked) {
        emit(state.CopyWith(state1: ScreenState.Loading));
        ApiManager apiManager = ApiManager();
        LginRemoteDsImpl lginRemoteDsImpl = LginRemoteDsImpl(apiManager);
        Loginlocalds loginlocalds = LoginLocaldsimpl();
        LoginRepoImpl loginRepoImpl = LoginRepoImpl(lginRemoteDsImpl ,loginlocalds );
        LoginUseCase loginUseCase = LoginUseCase(loginRepoImpl);

        LoginRequestModel loginRequestModel = LoginRequestModel(
            email: EmailController.text, password: PassController.text);

        var res = await loginUseCase.call(loginRequestModel);

        res.fold(
            (l) => {
                  // login fail
                  emit(state.CopyWith(
                      state1: ScreenState.LoginError, loginfail: RemoteFailures(l.toString())))
                },
            (r) => {
                  // login entity
                  emit(state.CopyWith(
                      state1: ScreenState.LoginSuccess, login: r))
                });
      }
    });
  }
}
