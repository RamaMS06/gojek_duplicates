part of 'gopaylater_bloc.dart';

sealed class GopaylaterEvent extends Equatable {
  const GopaylaterEvent();

  @override
  List<Object> get props => [];
}

class FetchGoPayLater extends GopaylaterEvent{}
