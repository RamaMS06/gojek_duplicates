import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gojek_duplicates/data/models/item_onboarding_model.dart';
import 'package:gojek_duplicates/router/routes.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc(BuildContext context) : super(OnboardingLoaded()) {
    on<FetchDataOnBoard>((event, emit) {
      emit(OnboardingState(listData: [
        ItemOnBoardingModel(
            image: 'onboarding1',
            title: 'Welcome to Gojek!',
            desc:
                'Your go-to app for a hassle-free life. We are here to help with all your need anywhere'),
        ItemOnBoardingModel(
            image: 'onboarding2',
            title: 'Order food & groceries',
            desc: 'Either needs or cravings, we got you covered.'),
        ItemOnBoardingModel(
            image: 'onboarding3',
            title: 'Payment',
            desc:
                'Pay utility bills, phone credit, and transfer money from your phone.'),
        ItemOnBoardingModel(
            image: 'onboarding4',
            title: 'Transport & logistics',
            desc: 'Daily commute and goods delivery made easy.'),
      ]));
    });

    on<OnBoardingChanged>((event, emit) {
      emit(OnboardingState(listData: state.listData, index: event.index));
    });

    on<GoToLoginPage>((event, emit) {
      context.push(Routes.loginPage);
    });
  }
}
