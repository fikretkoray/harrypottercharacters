import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harry_potter_characters/features/characters/data/services/character_details_service.dart';
import 'dio_provider.dart'; // ← burası önemli

final characterDetailsServiceProvider = Provider<CharacterDetailsService>((ref) {
  final dio = ref.watch(dioProvider);
  return CharacterDetailsService(dio);
});
