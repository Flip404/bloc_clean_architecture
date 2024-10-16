import 'package:bloc_clean_architecture/core/errors/exceptions.dart';
import 'package:bloc_clean_architecture/core/errors/failure.dart';
import 'package:bloc_clean_architecture/features/note/domain/repositories/note_repositories.dart';
import 'package:bloc_clean_architecture/features/note/data/datasources/note_data_source.dart';
import 'package:bloc_clean_architecture/features/note/data/models/note_model.dart';
import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

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

  @override
  Future<Either<Failure, NoteModel>> createNotes(
      {required String title, required String note}) async {
    try {
      const uuid = Uuid();
      NoteModel noteModel =
          NoteModel(uuid: uuid.v1(), title: title, note: note);
      final data = await noteDataSource.createNote(noteModel);
      return Right(data);
    } on ReadException {
      return Left(WriteFailure(errorMessage: "Fail to write database"));
    }
  }
}
