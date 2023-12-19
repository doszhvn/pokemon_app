import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/pokemon.dart';
import 'package:practice_8_9/rest_client/mobile_api_pokemon.dart';

import '../../../rest_client/mobile_api_dio.dart';
import '../bloc/list_bloc.dart';

class PokemonRepository {
  final _mobileClientPokemon = MobileClientPokemon(MobileApiDio().client);

  Future<void> getListData(
      FetchedListEvent event, Emitter<ListState> emit) async {
    emit(LoadingListState());
    try {
      final getListData = await _mobileClientPokemon.getListData();
      emit(LoadedListState(getListData as PokemonListResponse));
    } catch (e) {
      emit(FailureProfileState(e.toString()));
    }
  }
}
