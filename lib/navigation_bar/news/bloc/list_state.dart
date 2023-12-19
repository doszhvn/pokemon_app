part of 'list_bloc.dart';

@immutable
abstract class ListState {}

class ListInitial extends ListState {}

class LoadingListState extends ListState {}

class LoadedListState extends ListState {
  final PokemonListResponse pokemonListResponse;
  LoadedListState(this.pokemonListResponse);
}

class FailureProfileState extends ListState {
  final String e;
  FailureProfileState(this.e);
}
