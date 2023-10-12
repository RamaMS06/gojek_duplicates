import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class SearchAppBarWithProfile extends StatelessWidget {
  const SearchAppBarWithProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.76,
          child: TextField(
              enabled: false,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  hintText: 'Find services, food, or places',
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w300, fontSize: 13),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.02),
                  prefixIcon: Icon(EvaIcons.search,
                      color: Colors.black.withOpacity(0.8)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  focusedBorder: OutlineInputBorder(
                      gapPadding: 0,
                      borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.5), width: 0.1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                  border: OutlineInputBorder(
                      gapPadding: 0,
                      borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.5), width: 0.1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30)))))),
      Container(
        height: 40,
        width: 40,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Image.asset('assets/images/img-profile.jpg', fit: BoxFit.cover),
      )
    ]);
  }
}
