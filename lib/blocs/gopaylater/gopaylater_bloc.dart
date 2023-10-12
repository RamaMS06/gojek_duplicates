import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gojek_duplicates/data/models/item_gopaylater_model.dart';

part 'gopaylater_event.dart';
part 'gopaylater_state.dart';

class GopaylaterBloc extends Bloc<GopaylaterEvent, GopaylaterState> {
  GopaylaterBloc() : super(GopaylaterInitial()) {
    on<GopaylaterEvent>((event, emit) async {
      emit(GoPayLaterLoading());
      await Future.delayed(const Duration(seconds: 4));
      emit(GoPayLaterLoaded(listData: [
        ItemGopayLaterModel(
            icon: 'paylater1',
            title: 'Makin Seru nih',
            desc: 'Aktifkan & Sambungkan GoPay & GoPayLater di Tokopedia'),
        ItemGopayLaterModel(
            icon: 'paylater2',
            title: 'Sambungin akun yuk',
            desc: 'Sambungin Akun ke Tokopedia, Banyakin Untung'),
        ItemGopayLaterModel(
            icon: 'paylater3',
            title: 'Bayar lebih hemat',
            desc: 'Promo Belanja Online 10.10: Cashback hingga Rp100.000')
      ]));
    });
  }
}
