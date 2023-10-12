part of 'amount_bloc.dart';

class AmountState extends Equatable {
  final List<ItemAmountModel>? listAmount;
  final List<ItemFavoriteModel>? listFavorite;
  final int? index;
  const AmountState({this.listAmount, this.listFavorite, this.index});

  AmountState copyWith(
          {List<ItemAmountModel>? listAmount,
          List<ItemFavoriteModel>? listFavorite,
          int? index}) =>
      AmountState(
          listAmount: listAmount ?? this.listAmount,
          listFavorite: listFavorite ?? this.listFavorite,
          index: index ?? this.index);

  changeSelected(int index) {
    listAmount?.forEach((element) => element.isSelected = false);
    listAmount?[index].isSelected = true;
  }

  @override
  List<Object> get props => [listAmount ?? [], index ?? 0];
}

class HomeInitial extends AmountState {}

class AmountChanged extends AmountState {
  @override
  List<Object> get props => [listAmount ?? []];
}
