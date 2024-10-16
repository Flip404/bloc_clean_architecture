import 'package:bloc_clean_architecture/core/errors/failure.dart';
import 'package:bloc_clean_architecture/core/usecase/usecase.dart';
import 'package:bloc_clean_architecture/features/note/domain/entities/note_entities.dart';
import 'package:bloc_clean_architecture/features/note/domain/repositories/note_repositories.dart';
import 'package:dartz/dartz.dart';

class GetAllNotes implements Usecase<List<NoteEntity>, NoParam> {
  final NoteRepositories repositories;

  GetAllNotes(this.repositories);

  @override
  Future<Either<Failure, List<NoteEntity>>> call(NoParam params) async {
    return await repositories.getAllNotes();
  }
}
