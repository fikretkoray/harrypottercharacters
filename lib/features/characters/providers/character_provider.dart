import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harry_potter_characters/features/characters/data/models/character_model.dart';
import 'package:harry_potter_characters/features/characters/providers/service_provider.dart';

final characterProvider = FutureProvider<List<CharacterModel>>((ref) async {
  final characterDetailsService = ref.watch(characterDetailsServiceProvider);
  return characterDetailsService.fetchCharacters();
});