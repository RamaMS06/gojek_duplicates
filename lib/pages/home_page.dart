import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gojek_duplicates/blocs/amount/amount_bloc.dart';
import 'package:gojek_duplicates/blocs/favorite/favorite_bloc.dart';
import 'package:gojek_duplicates/blocs/gopaylater/gopaylater_bloc.dart';
import 'package:gojek_duplicates/data/models/item_submenu_amount_model.dart';
import 'package:gojek_duplicates/utils/colors.dart';
import 'package:gojek_duplicates/utils/int.dart';
import 'package:gojek_duplicates/utils/text_style.dart';
import 'package:gojek_duplicates/widgets/appbar.dart';
import 'package:gojek_duplicates/widgets/cards.dart';
import 'package:gojek_duplicates/widgets/divider.dart';
import 'package:gojek_duplicates/widgets/menu_item.dart';
import 'package:gojek_duplicates/widgets/shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final listSubMenuAmount = [
      ItemSubMenuAmountModel(image: 'ic-bayar', label: 'Pay'),
      ItemSubMenuAmountModel(image: 'ic-topup', label: 'Top Up'),
      ItemSubMenuAmountModel(image: 'ic-eksplor', label: 'Ekslore')
    ];

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AmountBloc()..add(FetchAmount())),
        BlocProvider(create: (_) => FavoriteBloc()..add(FetchFavorite())),
        BlocProvider(create: (_) => GopaylaterBloc()..add(FetchGoPayLater()))
      ],
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            title: const SearchAppBarWithProfile()),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 15),
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: CustomColors.blue1),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          BlocBuilder<AmountBloc, AmountState>(
                            builder: (context, state) {
                              return Column(
                                  children: List.generate(
                                      state.listAmount?.length ?? 0,
                                      (index) => DividerOpacity(
                                          isSelected: state
                                              .listAmount?[index].isSelected)));
                            },
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: 110,
                            child: BlocBuilder<AmountBloc, AmountState>(
                              builder: (context, state) {
                                return PageView.builder(
                                    controller: PageController(
                                        viewportFraction: 0.75,
                                        initialPage: state.index ?? 0),
                                    itemCount: 2,
                                    pageSnapping: true,
                                    scrollDirection: Axis.vertical,
                                    onPageChanged: (val) {
                                      context
                                          .read<AmountBloc>()
                                          .add(ChangeIndexAmount(index: val));
                                    },
                                    itemBuilder: (context, index) {
                                      return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4),
                                          child: CardAmount(
                                              amount: state.listAmount?[index]
                                                      .amount ??
                                                  0,
                                              isSelected: state
                                                  .listAmount?[index]
                                                  .isSelected));
                                    });
                              },
                            ),
                          )
                        ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                                listSubMenuAmount.length,
                                (index) => SubMenuItemAmount(
                                    item: listSubMenuAmount[index]))),
                      ],
                    )),
              ),
              BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, state) {
                  if (state is FavoriteLoading) {
                    return const GridFavoriteShimmer(
                      padding: EdgeInsets.only(top: 32),
                    );
                  } else {
                    return GridView.builder(
                        padding: const EdgeInsets.only(top: 32),
                        itemCount: 8,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 12.5,
                            childAspectRatio: orientationSize(2, 1)),
                        itemBuilder: (context, index) =>
                            FavoriteMenu(item: state.listFavorite?[index]));
                  }
                },
              ),
              const CardTreasure(value: 100),
              Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text('Akses Cepat',
                      style: CustomTextStyle.bold().copyWith(fontSize: 18))),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Colors.black.withOpacity(0.25), width: 1)),
                child: Column(
                  children: List.generate(
                      2,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 17),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Image.asset(
                                      'assets/icons/menus/ic-goride.png',
                                      width: 24,
                                      height: 24),
                                  const SizedBox(width: 15),
                                  const Text('Pintu masuk motor, Kokas')
                                ]),
                                const Icon(Icons.arrow_forward_ios, size: 12)
                              ],
                            ),
                          )),
                ),
              ),
              const SizedBox(height: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/icons/ic-gopaylater.png',
                      height: 14, width: 100),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text('Lebih hemat pake GoPayLater \u{1F929}',
                          style:
                              CustomTextStyle.bold().copyWith(fontSize: 16))),
                  const Text(
                      'Yuk, belanja di Tokopedia pake GoPay Later dan nikmatin cashback-nya~'),
                  const SizedBox(height: 24),
                  BlocBuilder<GopaylaterBloc, GopaylaterState>(
                    builder: (context, state) {
                      if (state is GoPayLaterLoading) {
                        return const CardShimmer();
                      } else {
                        return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 24),
                            itemBuilder: (context, index) => GoPayLaterCards(
                                  item: state.listData?[index],
                                ));
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 100)
            ],
          ),
        ),
      ),
    );
  }
}
