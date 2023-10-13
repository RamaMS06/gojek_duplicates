import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gojek_duplicates/data/models/item_country_model.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc(BuildContext context) : super(CountryInitial()) {
    on<FetchCountry>((event, emit) async {
      String data = await DefaultAssetBundle.of(context)
          .loadString('assets/data/country_codes.json');
      final listCountry = (jsonDecode(data) as List)
          .map((e) => ItemCountryModel.fromJson(e))
          .toList();

      emit(CountryState(
          listCountry: listCountry, listFilterCountry: listCountry));
    });

    on<SearchCountry>((event, emit) {
      final searchList = (state.listCountry ?? [])
          .where((element) =>
              (element.name)
                  ?.toLowerCase()
                  .contains(event.query.toLowerCase()) ??
              false)
          .toList();
      emit(const CountryState().copyWith(
          listCountry: state.listCountry, listFilterCountry: searchList));
    });

    on<SelectedCountry>((event, emit) {
      emit(const CountryState().copyWith(
          listCountry: state.listCountry,
          listFilterCountry: state.listFilterCountry,
          itemCountry: event.country));
      Navigator.pop(context);
    });
  }
}
