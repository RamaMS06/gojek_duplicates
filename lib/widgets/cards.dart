import 'package:flutter/material.dart';
import 'package:gojek_duplicates/data/models/item_gopaylater_model.dart';
import 'package:gojek_duplicates/data/models/item_onboarding_model.dart';
import 'package:gojek_duplicates/utils/colors.dart';
import 'package:gojek_duplicates/utils/string.dart';
import 'package:gojek_duplicates/utils/text_style.dart';

class CardAmount extends StatelessWidget {
  final double? amount;
  final bool? isSelected;
  const CardAmount({this.amount, this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: isSelected ?? false ? 1 : 0.5,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 250),
        scale: isSelected ?? false ? 1 : 0.97,
        child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/icons/ic-gopay.png', height: 14, width: 57),
                const SizedBox(height: 4),
                Text(amount?.toInt().formatRupiah() ?? '',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                const Text(
                  'Klik & cek riwayat',
                  style: TextStyle(
                      color: CustomColors.green2,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.5),
                )
              ],
            )),
      ),
    );
  }
}

class CardTreasure extends StatelessWidget {
  final int? value;
  const CardTreasure({this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  CustomColors.blue1.withOpacity(0.1),
                  CustomColors.blue1.withOpacity(0.05),
                  CustomColors.blue1.withOpacity(0.025),
                  CustomColors.blue1.withOpacity(0.015),
                  CustomColors.blue1.withOpacity(0)
                ]),
            border: Border.all(color: Colors.black.withOpacity(0.1), width: 1)),
        child: Stack(children: [
          Positioned(
              left: 8,
              top: 4,
              bottom: 4,
              child: Image.asset('assets/icons/ic-dots.png',
                  width: 120, height: 57)),
          Positioned.fill(
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset('assets/icons/ic-star.png',
                      width: 40, height: 40),
                  const SizedBox(width: 14),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${value ?? 0} XP there is a treasure',
                            style:
                                const TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                        Stack(
                          children: [
                            Container(
                              height: 4,
                              width: MediaQuery.of(context).size.width * 0.55,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.black.withOpacity(0.3)),
                            ),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              height: 4,
                              width:
                                  (MediaQuery.of(context).size.width * 0.55) -
                                      (value ?? 0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: CustomColors.green1),
                            )
                          ],
                        )
                      ])
                ]),
                const Icon(Icons.arrow_forward_ios, size: 18)
              ],
            ),
          )
        ]));
  }
}

class GoPayLaterCards extends StatelessWidget {
  final ItemGopayLaterModel? item;
  const GoPayLaterCards({this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black.withOpacity(0.25))),
      child: Column(
        children: [
          Image.asset('assets/images/img-${item?.icon ?? 'paylater1'}.png',
              height: 180,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${item?.title ?? 'Makin Seru'} \u{1F618}',
                    style: CustomTextStyle.bold().copyWith(fontSize: 16)),
                const SizedBox(height: 8),
                Text(item?.desc ??
                    'Aktifkan & Sambungkan GoPay & GoPayLater di Tokopedia')
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OnBoardingCard extends StatelessWidget {
  final ItemOnBoardingModel? item;
  const OnBoardingCard({this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ClipRRect(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
              'assets/images/img-${item?.image ?? 'onboarding1'}.jpeg',
              fit: BoxFit.cover,
              height: 200,
            )),
      ),
      const SizedBox(height: 40),
      Text(item?.title ?? 'Welcome to Gojek!',
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24)),
      const SizedBox(height: 16),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(item?.desc ?? '-',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
      )
    ]);
  }
}
