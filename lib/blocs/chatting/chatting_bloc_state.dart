// ignore_for_file: must_be_immutable

part of 'chatting_bloc.dart';

@immutable
sealed class ChattingBlocState {
  String? data;

  ChattingBlocState({this.data});
}

final class ChattingBlocInitial extends ChattingBlocState {
  ChattingBlocInitial(): super(data: 'Loading...');
}

final class ChattingBlocLoaded extends ChattingBlocState {
  ChattingBlocLoaded(String? data) : super(data: data);
}
