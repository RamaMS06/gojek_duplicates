import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gojek_duplicates/blocs/country/country_bloc.dart';
import 'package:gojek_duplicates/blocs/login/login_bloc.dart';
import 'package:gojek_duplicates/utils/colors.dart';
import 'package:gojek_duplicates/utils/text_style.dart';
import 'package:gojek_duplicates/widgets/appbar.dart';
import 'package:gojek_duplicates/widgets/bottom_sheets.dart';
import 'package:gojek_duplicates/widgets/buttons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => LoginBloc(context)..add(SetLoginPageIsReady())),
        BlocProvider(
            create: (context) => CountryBloc(context)..add(FetchCountry())),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarTemplate(
            leading: Row(children: [
              InkWell(
                  borderRadius: BorderRadius.circular(50),
                  child: const Icon(Icons.arrow_back, color: Colors.black),
                  onTap: () {
                    context.pop();
                  }),
              const SizedBox(width: 16),
              Image.asset('assets/icons/ic-gojek2.png', width: 100, height: 25)
            ]),
            trailing: const Icon(EvaIcons.questionMarkCircle,
                color: Colors.black, size: 28)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Enter your phone number',
                      style: CustomTextStyle.bold().copyWith(fontSize: 20)),
                  const SizedBox(height: 16),
                  const Text(
                      'You can log in or make an account if you\'re new to Gojek.'),
                  const SizedBox(height: 32),
                  RichText(
                      text: const TextSpan(
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.black),
                          children: [
                        TextSpan(text: 'Phone number'),
                        TextSpan(
                            text: '*',
                            style: TextStyle(color: CustomColors.red1))
                      ])),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocConsumer<CountryBloc, CountryState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          final indonesian = state.listCountry
                              ?.where((element) => element.code == 'ID')
                              .toList();
                          final itemCountry =
                              state.itemCountry ?? indonesian?[0];
                          return InkWell(
                            onTap: () {
                              showCountryBottomSheet(context, (country) {
                                context
                                    .read<CountryBloc>()
                                    .add(SelectedCountry(country: country));
                              });
                            },
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.2)),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(children: [
                                  Text(itemCountry?.flag ?? '',
                                      style: const TextStyle(fontSize: 20)),
                                  const SizedBox(width: 2),
                                  Text(itemCountry?.dialCode ?? '',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600))
                                ]),
                              ),
                            ),
                          );
                        },
                      ),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: TextField(
                                focusNode: context.read<LoginBloc>().phoneFN,
                                style: CustomTextStyle.bold(),
                                maxLines: 1,
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.only(bottom: 8),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black))),
                              ));
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text('Issue with number?',
                      style: TextStyle(
                          color: CustomColors.green2,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline))
                ],
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return ButtonTemplate(
                          label: 'Continue',
                          isLoading: state is LoginLoading,
                          type: ButtonTemplateType.primary,
                          onPressed: () {
                            context.read<LoginBloc>().add(DoLogin());
                          });
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
