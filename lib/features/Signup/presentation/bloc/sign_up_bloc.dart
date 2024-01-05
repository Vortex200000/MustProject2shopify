import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mustproject2shopify2/core/API/API_Manager.dart';
import 'package:mustproject2shopify2/core/error/remote_error.dart';
import 'package:mustproject2shopify2/features/Signup/data/dataSources/remotedDs/signupremoteDS.dart';
import 'package:mustproject2shopify2/features/Signup/data/dataSources/remotedDs/signupremotedDSIMPL.dart';
import 'package:mustproject2shopify2/features/Signup/data/model/SignUpReqModel.dart';
import 'package:mustproject2shopify2/features/Signup/data/repository/SignUpRepoImpl.dart';
import 'package:mustproject2shopify2/features/Signup/domain/Entity/SignUpEntity.dart';
import 'package:mustproject2shopify2/features/Signup/domain/SignUpUseCase/SignUpUseCase.dart';
import 'package:mustproject2shopify2/features/Signup/domain/repository/SignUpRepo.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  static SignUpBloc get(context) => BlocProvider.of(context);
  var NameController = TextEditingController();
  var EmailController = TextEditingController();
  var PhoneController = TextEditingController();
  var PasswordController = TextEditingController();

  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is SignUpBtnClicked) {
        emit(state.CopyWith(signUppScreenState1: SignUpScreenState.loading));

        ApiManager apiManager = ApiManager();
        SignUpRemoteDs signUpRemoteDs = SignUpRemoteDsImpl(apiManager);
        SignUpRepo signUpRepo = SignUpRepoImpl(signUpRemoteDs);

        SignUpUseCase signUpUseCase = SignUpUseCase(signUpRepo);
        SignUpReqModel signUpReqModel = SignUpReqModel(
            name: NameController.text,
            email: EmailController.text,
            phone: PhoneController.text,
            password: PasswordController.text,
            repassword: PasswordController.text);

        var res = await signUpUseCase.call(signUpReqModel);

        res.fold(
            (l) => {
                  emit(state.CopyWith(
                      signUppScreenState1: SignUpScreenState.SignUpError,
                      SignfAIL: l))
                },
            (r) => {
                  emit(state.CopyWith(
                      signUppScreenState1: SignUpScreenState.SignUpSuccess,
                      signUpEntityy: r))
                });
      }
    });
  }
}
