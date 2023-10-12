part of 'gopaylater_bloc.dart';

class GopaylaterState extends Equatable {
  final List<ItemGopayLaterModel>? listData;
  const GopaylaterState({this.listData});

  GopaylaterState copyWith({List<ItemGopayLaterModel>? listData}) =>
      GopaylaterState(listData: listData ?? this.listData);

  @override
  List<Object> get props => [listData ?? []];
}

final class GopaylaterInitial extends GopaylaterState {}

final class GoPayLaterLoading extends GopaylaterState {}

final class GoPayLaterLoaded extends GopaylaterState {
 const GoPayLaterLoaded({List<ItemGopayLaterModel>? listData})
      : super(listData: listData);
  
  @override
  List<Object> get props => [listData ?? []];
}
