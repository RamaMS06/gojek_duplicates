import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gojek_duplicates/data/models/item_navigation_home_model.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  List<ItemNavigationHomeModel> listNav = [];
  final PageController pageController = PageController();

  BottomNavigationBloc() : super(BottomNavigationState()) {
    on<BottomNavigationInitial>((event, emit) {
      emit(BottomNavigationState(listNavigation: [
        ItemNavigationHomeModel(
            icon: EvaIcons.home, label: 'Home', isSelected: true),
        ItemNavigationHomeModel(icon: EvaIcons.percent, label: 'Promos'),
        ItemNavigationHomeModel(icon: EvaIcons.shoppingBag, label: 'Orders'),
        ItemNavigationHomeModel(icon: EvaIcons.messageSquare, label: 'Chat')
      ]));
    });

    on<BottomNavigationOnChange>((event, emit) {
      switch (event.index) {
        case 0:
          emit(HomeNavigation().copyWith(
            listNavigation: state.listNavigation,
            position: 0,
          ));
        case 1:
          emit(PromosNavigation().copyWith(
            listNavigation: state.listNavigation,
            position: 0.24,
          ));
        case 2:
          emit(OrdersNavigation().copyWith(
            listNavigation: state.listNavigation,
            position: 0.48,
          ));
        case 3:
          emit(ChatNavigation().copyWith(
            listNavigation: state.listNavigation,
            position: 0.72,
          ));
      }

      state.changedSelected(event.index);
      pageController.animateToPage(event.index,
          duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
    });
  }

  @override
  void onEvent(BottomNavigationEvent event) {
    print(event);
    super.onEvent(event);
  }

  @override
  void onChange(Change<BottomNavigationState> change) {
    print(change);
    super.onChange(change);
  }
}
