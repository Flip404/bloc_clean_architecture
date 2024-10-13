import 'package:bloc_clean_architecture/core/constants/constants.dart';
import 'package:bloc_clean_architecture/features/home/business/entities/note_entities.dart';

class NoteModel extends NoteEntity {
  NoteModel({required super.uuid, required super.title, required super.note});

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        uuid: json[kNoteColumnUuid],
        title: json[kNoteColumnTitle],
        note: json[kNoteColumnNote],
      );

  Map<String, dynamic> toJson() =>
      {kNoteColumnUuid: uuid, kNoteColumnTitle: title, kNoteColumnNote: note};
}
