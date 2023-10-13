import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gojek_duplicates/blocs/onboarding/onboarding_bloc.dart';
import 'package:gojek_duplicates/utils/colors.dart';
import 'package:gojek_duplicates/widgets/appbar.dart';
import 'package:gojek_duplicates/widgets/buttons.dart';
import 'package:gojek_duplicates/widgets/cards.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(context)..add(FetchDataOnBoard()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const AppBarTemplate(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Stack(
              children: [
                Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: BlocBuilder<OnboardingBloc, OnboardingState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 340,
                              child: PageView(
                                  onPageChanged: (val) {
                                    context
                                        .read<OnboardingBloc>()
                                        .add(OnBoardingChanged(index: val));
                                  },
                                  children: List.generate(
                                      state.listData?.length ?? 0,
                                      (index) => OnBoardingCard(
                                            item: state.listData?[index],
                                          ))),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                    state.listData?.length ?? 0, (index) {
                                  bool isCurrentIndex = state.index == index;
                                  return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 150),
                                          height: 8,
                                          width: isCurrentIndex ? 16 : 8,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: isCurrentIndex
                                                  ? CustomColors.green1
                                                  : Colors.grey)));
                                })),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                children: [
                                  const SizedBox(height: 40),
                                  ButtonTemplate(
                                      label: 'Log in',
                                      type: ButtonTemplateType.primary,
                                      width: MediaQuery.of(context).size.width,
                                      onPressed: () {
                                        context
                                            .read<OnboardingBloc>()
                                            .add(GoToLoginPage());
                                      }),
                                  const SizedBox(height: 16),
                                  ButtonTemplate(
                                      label: 'I\'m new, sign me up',
                                      type: ButtonTemplateType.secondary,
                                      width: MediaQuery.of(context).size.width,
                                      onPressed: () {}),
                                  const SizedBox(height: 16),
                                  const Text(
                                      'By logging in or registering, you agree to our Terms of service and Privacy policy.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12))
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
