import 'package:flutter/material.dart';

class CharacterDetailsRow extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const CharacterDetailsRow({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.black54),
          const SizedBox(width: 8),
          Text('$title:', style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Expanded(child: Text(value.isNotEmpty ? value : 'Unknown')),
        ],
      ),
    );
  }
}
