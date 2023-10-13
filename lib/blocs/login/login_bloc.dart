import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gojek_duplicates/router/routes.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  TextEditingController phoneTC = TextEditingController();
  FocusNode phoneFN = FocusNode();

  LoginBloc(BuildContext context) : super(LoginInitial()) {
    on<SetLoginPageIsReady>((event, emit) async {
      await Future.delayed(const Duration(milliseconds: 700));
      phoneFN.requestFocus();
    });

    on<DoLogin>((event, emit) async {
      emit(LoginLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(LoginLoaded());
      context.go(Routes.mainPage);
    });
  }
}
