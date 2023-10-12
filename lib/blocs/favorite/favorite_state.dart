part of 'favorite_bloc.dart';

sealed class FavoriteState extends Equatable {
  final List<ItemFavoriteModel>? listFavorite;
  const FavoriteState({this.listFavorite});

  @override
  List<Object> get props => [listFavorite ?? []];
}

final class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  const FavoriteLoaded({List<ItemFavoriteModel>? listFavorite})
      : super(listFavorite: listFavorite);
  
  @override
  List<Object> get props => [listFavorite ?? []];
}
