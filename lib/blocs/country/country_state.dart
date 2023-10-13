part of 'country_bloc.dart';

class CountryState extends Equatable {
  final List<ItemCountryModel>? listCountry, listFilterCountry;
  final ItemCountryModel? itemCountry;
  const CountryState(
      {this.listCountry, this.listFilterCountry, this.itemCountry});

  CountryState copyWith(
          {List<ItemCountryModel>? listCountry,
          List<ItemCountryModel>? listFilterCountry,
          ItemCountryModel? itemCountry}) =>
      CountryState(
          listCountry: listCountry ?? this.listCountry,
          listFilterCountry: listFilterCountry ?? this.listCountry,
          itemCountry: itemCountry ?? this.itemCountry);

  @override
  List<Object> get props => [
        listCountry ?? [],
        listFilterCountry ?? [],
        itemCountry ?? ItemCountryModel()
      ];
}

final class CountryInitial extends CountryState {}
