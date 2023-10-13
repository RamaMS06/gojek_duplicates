import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gojek_duplicates/blocs/country/country_bloc.dart';
import 'package:gojek_duplicates/data/models/item_country_model.dart';

class CountryBottomSheet extends StatelessWidget {
  final Function(ItemCountryModel)? onSelected;
  const CountryBottomSheet({this.onSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CountryBloc(context)..add(FetchCountry()),
        child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Center(
                        child: Container(
                            height: 6,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(30)))),
                    const SizedBox(height: 16),
                    const Text('Search country code',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 35,
                              child: BlocBuilder<CountryBloc, CountryState>(
                                builder: (context, state) {
                                  return TextField(
                                      onChanged: (query) {
                                        context
                                            .read<CountryBloc>()
                                            .add(SearchCountry(query: query));
                                      },
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                          hintText:
                                              'Type country name or country code',
                                          prefixIconConstraints:
                                              const BoxConstraints(
                                                  minWidth: 35),
                                          prefixIcon: const Icon(EvaIcons.search,
                                              color: Colors.grey),
                                          filled: true,
                                          fillColor:
                                              Colors.grey.withOpacity(0.15),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 8),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.15))),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                  color: Colors.grey.withOpacity(0.15)))));
                                },
                              ),
                            ),
                            BlocBuilder<CountryBloc, CountryState>(
                              builder: (context, state) {
                                return Expanded(
                                  child: ListView.separated(
                                      itemCount:
                                          state.listFilterCountry?.length ?? 0,
                                      separatorBuilder: (context, index) =>
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            child: Container(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                height: 1),
                                          ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 24),
                                      itemBuilder: (context, index) {
                                        final searchCountry =
                                            state.listFilterCountry?[index];
                                        return InkWell(
                                          onTap: () {
                                            onSelected!(searchCountry ??
                                                ItemCountryModel());
                                          },
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Row(children: [
                                                    Text(
                                                        searchCountry?.flag ??
                                                            '',
                                                        style: const TextStyle(
                                                            fontSize: 24)),
                                                    const SizedBox(width: 8),
                                                    Flexible(
                                                      child: Text(
                                                          searchCountry?.name ??
                                                              '',
                                                          style: const TextStyle(
                                                              fontSize: 14,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    )
                                                  ]),
                                                ),
                                                const SizedBox(width: 44),
                                                Text(
                                                    searchCountry?.dialCode ??
                                                        '',
                                                    style: const TextStyle(
                                                        fontSize: 10))
                                              ]),
                                        );
                                      }),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
            )));
  }
}

showCountryBottomSheet(
    BuildContext context, Function(ItemCountryModel) onSelected) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) => CountryBottomSheet(onSelected: onSelected));
}
