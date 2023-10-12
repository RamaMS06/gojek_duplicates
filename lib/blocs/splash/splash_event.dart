part of 'splash_bloc.dart';

sealed class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

class SplashWaitLoading extends SplashEvent{}

class GoNextPage extends SplashEvent{}
