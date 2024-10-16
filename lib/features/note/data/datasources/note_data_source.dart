import 'package:bloc_clean_architecture/core/database/app_database.dart';
import 'package:bloc_clean_architecture/core/errors/exceptions.dart';
import 'package:bloc_clean_architecture/features/note/data/models/note_model.dart';

abstract class NoteDataSource {
  Future<List<NoteModel>> getAllNotes();

  Future<NoteModel> createNote(NoteModel note);
}

class NoteDataSourceImpl implements NoteDataSource {
  final AppDatabase _db;

  const NoteDataSourceImpl({required AppDatabase db}) : _db = db;

  @override
  Future<List<NoteModel>> getAllNotes() async {
    try {
      return await _db.readAllNote();
    } catch (e) {
      throw ReadException();
    }
  }

  @override
  Future<NoteModel> createNote(NoteModel note) async {
    try {
      return await _db.createNote(note);
    } catch (e) {
      throw ReadException();
    }
  }
}
