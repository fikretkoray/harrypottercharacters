import 'package:flutter/material.dart';
import 'package:harry_potter_characters/features/characters/presentation/widgets/character_list_card.dart';

class CharacterListScreen extends StatelessWidget {
  const CharacterListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Harry Potter',
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
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.height * 0.015,
              right: MediaQuery.of(context).size.height * 0.015,
              top: 10,
              bottom: MediaQuery.of(context).size.height * 0.05,
            ),
            child: CharacterListCard(),
          ),
        ],
      ),
    );
  }
}
