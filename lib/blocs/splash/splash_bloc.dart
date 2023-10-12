import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gojek_duplicates/router/routes.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final BuildContext context;
  SplashBloc(this.context) : super(SplashInitial()) {
    on<SplashWaitLoading>((event, emit) async {
      await Future.delayed(const Duration(seconds: 2));
      emit(SplashFinish());
    });

    on<GoNextPage>((event, emit) {
      context.go(Routes.mainPage);
    });
  }
}
