import 'package:flutter/material.dart';
import 'package:harry_potter_characters/core/utils/string_extensions.dart';
import 'package:harry_potter_characters/features/characters/data/models/character_model.dart';
import 'package:harry_potter_characters/features/characters/presentation/widgets/character_details_row.dart';

class CharacterDetailsCard extends StatelessWidget {
  final CharacterModel character;

  const CharacterDetailsCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.only(left: 20, right: 15, top: 15, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CharacterDetailsRow(
            title: 'House',
            value: character.house.capitalizeFirst(),
            icon: Icons.home,
          ),
          CharacterDetailsRow(
            title: 'Species',
            value: character.species.capitalizeFirst(),
            icon: Icons.person,
          ),
          CharacterDetailsRow(
            title: 'Gender',
            value: character.gender.capitalizeFirst(),
            icon: Icons.man,
          ),
          CharacterDetailsRow(
            title: 'Date of Birth',
            value: character.dateOfBirth ?? 'Unknown',
            icon: Icons.cake,
          ),
          CharacterDetailsRow(
            title: 'Ancestry',
            value: character.ancestry.capitalizeFirst(),
            icon: Icons.bloodtype,
          ),
          CharacterDetailsRow(
            title: 'Wizard?',
            value: character.wizard == true ? 'Yes' : 'No',
            icon: Icons.auto_fix_high,
          ),
          CharacterDetailsRow(
            title: 'Wand',
            value:
                character.wand != null
                    ? '${character.wand!.wood?.capitalizeFirst() ?? 'Unknown'}, ${character.wand!.length?.toString() ?? 'Unknown'}" (${character.wand!.core ?? 'Unknown'})'
                    : 'Unknown',
            icon: Icons.flash_on,
          ),
          CharacterDetailsRow(
            title: 'Patronus',
            value: character.patronus?.capitalizeFirst() ?? 'Unknown',
            icon: Icons.shield,
          ),
          CharacterDetailsRow(
            title: 'Hogwarts Student',
            value: character.hogwartsStudent == true ? 'Yes' : 'No',
            icon: Icons.school,
          ),
          CharacterDetailsRow(
            title: 'Actor',
            value: character.actor?.capitalizeFirst() ?? 'Unknown',
            icon: Icons.theater_comedy,
          ),
        ],
      ),
    );
  }
}
