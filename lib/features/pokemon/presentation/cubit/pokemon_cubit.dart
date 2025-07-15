import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/pokemon_model.dart';
import '../../data/models/pokemon_details_model.dart';
import '../../data/repositories/pokemon_repository.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final PokemonRepository repository;

  PokemonCubit(this.repository) : super(PokemonInitial());

  void loadPokemons() async {
    try {
      emit(PokemonLoading());
      final pokemons = await repository.fetchPokemonList();
      emit(PokemonLoaded(pokemons));
    } catch (e) {
      emit(PokemonError(e.toString()));
    }
  }

  void loadDetails(String url) async {
    try {
      emit(PokemonDetailLoading());
      final details = await repository.fetchPokemonDetails(url);
      emit(PokemonDetailLoaded(details));
    } catch (e) {
      emit(PokemonError(e.toString()));
    }
  }
}
