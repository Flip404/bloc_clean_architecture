import 'package:bloc_clean_architecture/features/note/domain/entities/note_entities.dart';
import 'package:flutter/material.dart';

class NoteStyle extends StatelessWidget {
  const NoteStyle({super.key, required this.noteEntity});

  final NoteEntity noteEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      width: (MediaQuery.of(context).size.width - 48) / 2,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.only(right: 8, top: 4, left: 4),
            decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).colorScheme.onPrimary),
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  noteEntity.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  noteEntity.note,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
