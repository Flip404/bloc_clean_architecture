import 'package:bloc_clean_architecture/core/errors/failure.dart';
import 'package:bloc_clean_architecture/features/home/business/entities/note_entities.dart';
import 'package:bloc_clean_architecture/features/home/business/repositories/note_repositories.dart';
import 'package:dartz/dartz.dart';

class GetAllNotes {
  final NoteRepositories repositories;

  GetAllNotes(this.repositories);

  Future<Either<Failure, List<NoteEntity>>> call() async {
    return await repositories.getAllNotes();
  }
}
