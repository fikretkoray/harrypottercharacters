import 'package:flutter/material.dart';

class CharacterHeaderCard extends StatelessWidget {
  final String? imageUrl;
  final String name;

  const CharacterHeaderCard({
    super.key,
    required this.imageUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          imageUrl != null
              ? CircleAvatar(
                radius: MediaQuery.of(context).size.height * 0.14,
                backgroundColor: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    imageUrl!,
                    errorBuilder:
                        (context, error, stackTrace) => ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/images/noimage.png',
                            height: MediaQuery.of(context).size.height * 0.12,
                          ),
                        ),
                  ),
                ),
              )
              : CircleAvatar(
                radius: MediaQuery.of(context).size.height * 0.12,
                backgroundColor: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset('assets/images/noimage.png'),
                ),
              ),
          const SizedBox(height: 10),
          Text(
            name.isNotEmpty ? name : 'Unknown Character',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
