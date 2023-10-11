// ignore_for_file: must_be_immutable

part of 'bottom_navigation_bloc.dart';

class BottomNavigationState extends Equatable {
  List<ItemNavigationHomeModel>? listNavigation;
  double? position;
  
  BottomNavigationState({this.listNavigation, this.position});

  BottomNavigationState copyWith(
      {List<ItemNavigationHomeModel>? listNavigation,
      double? position,
      }) {
    return BottomNavigationState(
        listNavigation: listNavigation ?? this.listNavigation,
        position: position ?? this.position,
        );
  }

  changedSelected(int index) {
    listNavigation?.forEach((element) => element.isSelected = false);
    listNavigation?[index].isSelected = true;
  }

  @override
  List<Object> get props => [listNavigation ?? [], position ?? 0];
}

final class HomeNavigation extends BottomNavigationState {}

final class PromosNavigation extends BottomNavigationState {}

final class OrdersNavigation extends BottomNavigationState {}

final class ChatNavigation extends BottomNavigationState {}
