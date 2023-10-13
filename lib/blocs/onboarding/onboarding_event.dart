part of 'onboarding_bloc.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class FetchDataOnBoard extends OnboardingEvent {}

class OnBoardinChanged extends OnboardingEvent {
  final int? index;

  const OnBoardinChanged({this.index});

  @override
  // TODO: implement props
  List<Object> get props => [index ?? 0];
}
