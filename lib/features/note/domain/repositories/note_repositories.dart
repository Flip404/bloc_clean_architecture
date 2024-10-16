import 'package:bloc_clean_architecture/core/errors/failure.dart';
import 'package:bloc_clean_architecture/features/note/domain/entities/note_entities.dart';
import 'package:dartz/dartz.dart';

abstract class NoteRepositories {
  Future<Either<Failure, List<NoteEntity>>> getAllNotes();

  Future<Either<Failure, NoteEntity>> createNotes(
      {required String title, required String note});
}
