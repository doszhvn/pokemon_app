import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../navigation_bar/news/model/pokemon.dart';
part 'mobile_api_pokemon.g.dart';

@RestApi(baseUrl: 'https://pokeapi.co/')
abstract class MobileClientPokemon {
  factory MobileClientPokemon(Dio dio, {String baseUrl}) = _MobileClientPokemon;

  @GET("api/v2/pokemon")
  Future<PokemonListResponse> getListData();
}
