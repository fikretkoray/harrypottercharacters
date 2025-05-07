import 'package:flutter/material.dart';
import 'package:harry_potter_characters/features/characters/data/models/character_model.dart';
import 'package:harry_potter_characters/features/characters/presentation/widgets/character_details_card.dart';
import 'package:harry_potter_characters/features/characters/presentation/widgets/character_header_card.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final CharacterModel character;

  const CharacterDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Character Details",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFD8EB0C),
      ),
      body: Stack(
        children: [
          // Kartların ön plana çıkabilmesi için arkaplana gradient ekledim
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFD8EB0C), Color(0xFFFFFFFF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // İçerik alanı
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.height * 0.015,
              right: MediaQuery.of(context).size.height * 0.015,
            ),
            child: ListView(
              padding: EdgeInsets.only(
                top: 10,
                bottom: MediaQuery.of(context).size.height * 0.09,
              ),
              children: [
                Column(
                  children: [
                    // Görselin ve karakterin adının olduğu kart
                    CharacterHeaderCard(
                      imageUrl: character.image,
                      name: character.name ?? '',
                    ),

                    // Karakterin detaylarının olduğu kart
                    const SizedBox(height: 20),
                    CharacterDetailsCard(character: character),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
