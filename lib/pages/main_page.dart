import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gojek_duplicates/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:gojek_duplicates/utils/colors.dart';
import 'package:gojek_duplicates/widgets/menu_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BottomNavigationBloc()..add(const BottomNavigationInitial()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned.fill(
                child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
              builder: (context, state) {
                return PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller:
                      context.read<BottomNavigationBloc>().pageController,
                  children: [
                    Container(color: Colors.red),
                    Container(color: Colors.black),
                    Container(color: Colors.blue),
                    Container(color: Colors.orange)
                  ],
                  onPageChanged: (val) {
                    // context
                    //     .read<BottomNavigationBloc>()
                    //     .add(BottomNavigationOnChange(val));
                  },
                );
              },
            )),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 85,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        offset: const Offset(0, -10),
                        spreadRadius: 1,
                        blurRadius: 24)
                  ]),
                  child: Stack(
                    children: [
                      BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
                        builder: (context, state) {
                          return AnimatedPositioned(
                            duration: const Duration(milliseconds: 150),
                            curve: Curves.easeInOut,
                            left: MediaQuery.of(context).size.width *
                                (state.position ?? 0),
                            top: 0,
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.24,
                                height: 3,
                                decoration: BoxDecoration(
                                    color: CustomColors.green2,
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(3),
                                        bottomRight: Radius.circular(3)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: CustomColors.green2
                                              .withOpacity(0.07),
                                          offset: const Offset(0, 16),
                                          blurRadius: 20,
                                          spreadRadius: 16),
                                    ])),
                          );
                        },
                      ),
                      BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
                        builder: (context, state) {
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: List.generate(
                                  state.listNavigation?.length ?? 0,
                                  (index) => Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: MenuItemNavigation(
                                          icon:
                                              state.listNavigation![index].icon,
                                          label: state
                                              .listNavigation![index].label,
                                          isSelected: state
                                              .listNavigation![index]
                                              .isSelected,
                                          onTapped: () {
                                            context
                                                .read<BottomNavigationBloc>()
                                                .add(BottomNavigationOnChange(
                                                    index));
                                          }))));
                        },
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
