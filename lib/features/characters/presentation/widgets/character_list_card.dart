import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:harry_potter_characters/features/characters/presentation/widgets/error_dialog.dart';
import 'package:harry_potter_characters/features/characters/providers/character_provider.dart';

class CharacterListCard extends ConsumerWidget {
  const CharacterListCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final charactersAsyncValue = ref.watch(characterProvider);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),

      child: charactersAsyncValue.when(
        data: (characters) {
          if (characters.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.search_off, size: 50, color: Colors.grey),
                  const SizedBox(height: 10),
                  const Text(
                    'Listelenecek karakter bulunamadı.',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              final character = characters[index];
              return ListTile(
                onTap: () {
                  context.push('/character-details', extra: character);
                },
                title: Text(character.name ?? 'Karakter Adı Bilinmiyor'),
                subtitle: Text(character.house ?? 'Ev Bilgisi Yok'),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child:
                      character.image != null
                          ? Image.network(
                            character.image!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/noimage.png',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              );
                            },
                          )
                          : Image.asset(
                            'assets/images/noimage.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                ),
              );
            },
          );
        },
        loading:
            () => const Center(
              child: CircularProgressIndicator(color: Color(0xFFD8EB0C)),
            ),
        error:
            (error, stackTrace) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, color: Colors.red, size: 50),
                  const SizedBox(height: 10),
                  Text(
                    'Bir şeyler ters gitti, lütfen tekrar deneyin.',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    getErrorMessage(error),
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
