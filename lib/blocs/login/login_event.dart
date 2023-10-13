part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class SetLoginPageIsReady extends LoginEvent{}

class DoLogin extends LoginEvent{}