import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/pokemon.dart';
import '../resourse/pokemon_repository.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  PokemonRepository _repository = PokemonRepository();
  ListBloc() : super(ListInitial()) {
    on<FetchedListEvent>(_repository.getListData);
  }
}
