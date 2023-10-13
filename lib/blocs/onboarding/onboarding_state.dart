part of 'onboarding_bloc.dart';

class OnboardingState extends Equatable {
  final List<ItemOnBoardingModel>? listData;
  final int? index;
  const OnboardingState({this.listData, this.index = 0});

  OnboardingState copyWith(
          {List<ItemOnBoardingModel>? listData, int? index = 0}) =>
      OnboardingState(
          listData: listData ?? this.listData, index: index ?? this.index);

  @override
  List<Object> get props => [listData ?? [], index ?? 0];
}

final class OnboardingInitial extends OnboardingState {}

final class OnboardingLoaded extends OnboardingState {}
