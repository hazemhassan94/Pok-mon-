import 'package:dio/dio.dart';
import '../../../../core/network/dio_client.dart';
import '../models/pokemon_model.dart';
import '../models/pokemon_details_model.dart';

class PokemonRepository {
  final Dio _dio = DioClient.dio;

  Future<List<PokemonModel>> fetchPokemonList() async {
    final response = await _dio.get('pokemon?limit=20');
    return (response.data['results'] as List)
        .map((json) => PokemonModel.fromJson(json))
        .toList();
  }

  Future<PokemonDetailsModel> fetchPokemonDetails(String url) async {
    final response = await _dio.get(url);
    return PokemonDetailsModel.fromJson(response.data);
  }
}
