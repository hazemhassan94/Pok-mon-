import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/pokemon_repository.dart';
import '../cubit/pokemon_cubit.dart';

class PokemonDetailPage extends StatelessWidget {
  final String url;
  const PokemonDetailPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PokemonCubit(PokemonRepository())..loadDetails(url),
      child: Scaffold(
        appBar: AppBar(title: const Text('Details')),
        body: BlocBuilder<PokemonCubit, PokemonState>(
          builder: (context, state) {
            if (state is PokemonDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PokemonDetailLoaded) {
              final p = state.details;
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(p.image, height: 120),
                    const SizedBox(height: 20),
                    Text(p.name.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text("Height: ${p.height}"),
                    Text("Weight: ${p.weight}"),
                    Text("Types: ${p.types.join(", ")}"),
                  ],
                ),
              );
            } else if (state is PokemonError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
