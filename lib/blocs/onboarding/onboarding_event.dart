part of 'onboarding_bloc.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class FetchDataOnBoard extends OnboardingEvent {}

class OnBoardingChanged extends OnboardingEvent {
  final int? index;

  const OnBoardingChanged({this.index});

  @override
  // TODO: implement props
  List<Object> get props => [index ?? 0];
}

class GoToLoginPage extends OnboardingEvent{}