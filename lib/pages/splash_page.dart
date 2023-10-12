import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gojek_duplicates/blocs/splash/splash_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(context)..add(SplashWaitLoading()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashFinish) {
            context.read<SplashBloc>().add(GoNextPage());
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              Center(
                child: Image.asset('assets/icons/ic-gojek.png',
                    height: 140, width: 140),
              ),
              Positioned(
                  bottom: 50,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      const Text('from',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16)),
                      Image.asset('assets/icons/ic-goto.png',
                          width: 60, height: 40)
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
