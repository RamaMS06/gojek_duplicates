import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chatting_bloc_event.dart';
part 'chatting_bloc_state.dart';

class ChattingBloc extends Bloc<ChattingBlocEvent, ChattingBlocState> {
  ChattingBloc() : super(ChattingBlocInitial()) {
    on<ChattingChange>((event, emit) async {
      await Future.delayed(const Duration(seconds: 2));
      emit(ChattingBlocLoaded('Halo!'));
    });
  }
}
