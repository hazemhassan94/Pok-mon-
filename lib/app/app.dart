import 'package:flutter/material.dart';
import '../features/pokemon/presentation/pages/pokemon_page.dart';

class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokémon App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const PokemonPage(),
    );
  }
}