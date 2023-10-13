part of 'country_bloc.dart';

sealed class CountryEvent extends Equatable {
  const CountryEvent();

  @override
  List<Object> get props => [];
}

class FetchCountry extends CountryEvent {}

class SearchCountry extends CountryEvent {
  final String query;

  const SearchCountry({required this.query});

  @override
  List<Object> get props => [query];
}

class SelectedCountry extends CountryEvent {
  final ItemCountryModel country;

  const SelectedCountry({required this.country});

  @override
  List<Object> get props => [country];
}
