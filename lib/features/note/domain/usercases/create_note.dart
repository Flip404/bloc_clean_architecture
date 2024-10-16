// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_clean_architecture/core/errors/failure.dart';
import 'package:bloc_clean_architecture/core/usecase/usecase.dart';
import 'package:bloc_clean_architecture/features/note/domain/entities/note_entities.dart';
import 'package:bloc_clean_architecture/features/note/domain/repositories/note_repositories.dart';
import 'package:dartz/dartz.dart';

class CreateNote implements Usecase<NoteEntity, CreateNoteParam> {
  final NoteRepositories repositories;

  CreateNote(this.repositories);
  @override
  Future<Either<Failure, NoteEntity>> call(CreateNoteParam param) async {
    return await repositories.createNotes(title: param.title, note: param.note);
  }
}

class CreateNoteParam {
  final String title;
  final String note;
  CreateNoteParam({required this.title, required this.note});
}
