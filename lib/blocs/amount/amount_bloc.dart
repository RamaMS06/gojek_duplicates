import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gojek_duplicates/data/models/item_amount_model.dart';
import 'package:gojek_duplicates/data/models/item_favorite_model.dart';

part 'amount_event.dart';
part 'amount_state.dart';

class AmountBloc extends Bloc<AmountEvent, AmountState> {
  final pageController = PageController();
  AmountBloc() : super(HomeInitial()) {
    on<FetchAmount>((event, emit) async {
      emit(HomeInitial().copyWith(listAmount: [
        ItemAmountModel(amount: 20000, isSelected: true),
        ItemAmountModel(amount: 18500, isSelected: false)
      ]));
    });

    on<ChangeIndexAmount>((event, emit) {
      state.changeSelected(event.index ?? 0);
      emit(AmountChanged()
          .copyWith(listAmount: state.listAmount, index: event.index));
    });
  }
}
