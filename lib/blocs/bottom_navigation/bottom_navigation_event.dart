// ignore_for_file: must_be_immutable

part of 'bottom_navigation_bloc.dart';

sealed class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();

  @override
  List<Object> get props => [];
}

class BottomNavigationInitial extends BottomNavigationEvent {
  const BottomNavigationInitial();
}

class BottomNavigationOnChange extends BottomNavigationEvent {
  int index;
  BottomNavigationOnChange(this.index);

  @override
  List<Object> get props => [index];
}
