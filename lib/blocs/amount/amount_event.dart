part of 'amount_bloc.dart';

sealed class AmountEvent extends Equatable {
  const AmountEvent();

  @override
  List<Object> get props => [];
}

class FetchAmount extends AmountEvent {}

class ChangeIndexAmount extends AmountEvent {
  final int? index;
  const ChangeIndexAmount({this.index});

  @override
  List<Object> get props => [index ?? 0];
}
