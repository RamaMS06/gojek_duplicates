import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gojek_duplicates/data/models/item_favorite_model.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<FetchFavorite>((event, emit) async {
      emit(FavoriteLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(FavoriteLoaded(listFavorite: [
        ItemFavoriteModel(icon: 'ic-goride', label: 'GoRide'),
        ItemFavoriteModel(icon: 'ic-gocar', label: 'GoCar'),
        ItemFavoriteModel(icon: 'ic-gofood', label: 'GoFood'),
        ItemFavoriteModel(icon: 'ic-gosend', label: 'GoSend'),
        ItemFavoriteModel(icon: 'ic-gomart', label: 'GoMart'),
        ItemFavoriteModel(icon: 'ic-gopulsa', label: 'GoPulsa'),
        ItemFavoriteModel(icon: 'ic-goclub', label: 'GoClub'),
        ItemFavoriteModel(icon: 'ic-more', label: 'More')
      ]));
    });
  }
}
