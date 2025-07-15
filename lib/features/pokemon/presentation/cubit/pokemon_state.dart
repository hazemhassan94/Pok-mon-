part of 'pokemon_cubit.dart';

abstract class PokemonState {}

class PokemonInitial extends PokemonState {}
class PokemonLoading extends PokemonState {}
class PokemonLoaded extends PokemonState {
  final List<PokemonModel> pokemons;
  PokemonLoaded(this.pokemons);
}
class PokemonDetailLoading extends PokemonState {}
class PokemonDetailLoaded extends PokemonState {
  final PokemonDetailsModel details;
  PokemonDetailLoaded(this.details);
}
class PokemonError extends PokemonState {
  final String message;
  PokemonError(this.message);
}
