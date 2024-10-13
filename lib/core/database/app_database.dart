import 'package:bloc_clean_architecture/core/constants/constants.dart';
import 'package:bloc_clean_architecture/features/home/data/models/note_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  AppDatabase._init();

  static final AppDatabase instance = AppDatabase._init();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initializeDB(kDBFileName);
    return _database!;
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $kTableNote(
        $kNoteColumnUuid text primary key,
        $kNoteColumnTitle text not null,
        $kNoteColumnNote text
      )
    ''');
  }

  Future<Database> _initializeDB(String fileName) async {
    final dbPath = await getApplicationSupportDirectory();
    final path = "${dbPath.path}/$fileName";
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<NoteModel> createNote(NoteModel note) async {
    final db = await instance.database;
    await db.insert(kTableNote, note.toJson());
    return note;
  }

  Future<List<NoteModel>> readAllNote() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> data = await db.query(kTableNote);
    return data.map((json) => NoteModel.fromJson(json)).toList();
  }

  Future<int> updateNote(NoteModel note) async {
    final db = await instance.database;
    return await db.update(kTableNote, note.toJson(),
        where: "$kNoteColumnUuid = ?", whereArgs: [note.uuid]);
  }

  Future<int> deleteNote(String id) async {
    final db = await instance.database;
    return await db
        .delete(kTableNote, where: "$kNoteColumnUuid =?", whereArgs: [id]);
  }

  Future<void> close() async {
    final db = await instance.database;
    await db.close();
  }
}
