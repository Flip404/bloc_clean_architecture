import 'package:bloc_clean_architecture/core/database/app_database.dart';
import 'package:bloc_clean_architecture/core/errors/exceptions.dart';
import 'package:bloc_clean_architecture/features/home/data/models/note_model.dart';

abstract class NoteDataSource {
  Future<List<NoteModel>> getAllNotes();
}

class NoteDataSourceImpl implements NoteDataSource {
  @override
  Future<List<NoteModel>> getAllNotes() async {
    try {
      final db = AppDatabase.instance;
      return await db.readAllNote();
    } catch (e) {
      throw ReadException();
    }
  }
}
