import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:harry_potter_characters/features/characters/data/models/character_model.dart';
import 'package:harry_potter_characters/features/characters/presentation/pages/character_details_screen.dart';
import 'package:harry_potter_characters/features/characters/presentation/pages/character_list_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const CharacterListScreen(),
      ),
      GoRoute(
        path: '/character-details',
        builder: (context, state) {
          final character = state.extra as CharacterModel;
          return CharacterDetailsScreen(character: character);
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Harry Potter Characters',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
