import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gojek_duplicates/blocs/chatting/chatting_bloc.dart';
import 'package:gojek_duplicates/utils/colors.dart';
import 'package:gojek_duplicates/utils/text_style.dart';

class ChattingPage extends StatelessWidget {
  const ChattingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChattingBloc()..add(ChattingChange()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          centerTitle: false,
          title: const Text('Chat',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22)),
        ),
        body: Stack(
          children: [
            Center(
              child: BlocBuilder<ChattingBloc, ChattingBlocState>(
                builder: (context, state) {
                  switch (state) {
                    case ChattingBlocInitial():
                      return const Text('Loading...');
                    case ChattingBlocLoaded():
                      return Text(
                        state.data ?? '',
                        style: CustomTextStyle.medium()
                            .copyWith(color: CustomColors.green1),
                      );
                    default:
                      return const RefreshProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
