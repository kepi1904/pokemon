import 'package:pokemon/app/modules/home/models/pokemon_model.dart';

abstract class PokemonRepository {
  Future<List<PokemonModel>?> getData({String pageNum});
}
