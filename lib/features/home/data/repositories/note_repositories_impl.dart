import 'package:bloc_clean_architecture/core/errors/exceptions.dart';
import 'package:bloc_clean_architecture/core/errors/failure.dart';
import 'package:bloc_clean_architecture/features/home/business/repositories/note_repositories.dart';
import 'package:bloc_clean_architecture/features/home/data/datasources/note_data_source.dart';
import 'package:bloc_clean_architecture/features/home/data/models/note_model.dart';
import 'package:dartz/dartz.dart';

class NoteRepositoriesImpl implements NoteRepositories {
  final NoteDataSource noteDataSource;

  NoteRepositoriesImpl({required this.noteDataSource});

  @override
  Future<Either<Failure, List<NoteModel>>> getAllNotes() async {
    try {
      final data = await noteDataSource.getAllNotes();
      return Right(data);
    } on ReadException {
      return Left(ReadFailure(errorMessage: "Fail to load database"));
    }
  }
}
