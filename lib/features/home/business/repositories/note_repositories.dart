import 'package:bloc_clean_architecture/core/errors/failure.dart';
import 'package:bloc_clean_architecture/features/home/business/entities/note_entities.dart';
import 'package:dartz/dartz.dart';

abstract class NoteRepositories {
  Future<Either<Failure, List<NoteEntity>>> getAllNotes();
}
