import 'package:bloc_clean_architecture/core/database/app_database.dart';
import 'package:bloc_clean_architecture/core/routes/routes.dart';
import 'package:bloc_clean_architecture/core/theme/theme.dart';
import 'package:bloc_clean_architecture/features/note/data/datasources/note_data_source.dart';
import 'package:bloc_clean_architecture/features/note/data/repositories/note_repositories_impl.dart';
import 'package:bloc_clean_architecture/features/note/domain/usercases/create_note.dart';
import 'package:bloc_clean_architecture/features/note/domain/usercases/get_all_notes.dart';
import 'package:bloc_clean_architecture/features/note/presentation/bloc/note_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final AppDatabase db = AppDatabase.instance;
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<NoteBloc>(
          create: (context) => NoteBloc(
            getAllNote: GetAllNotes(
              NoteRepositoriesImpl(
                noteDataSource: NoteDataSourceImpl(db: db),
              ),
            ),
            createNote: CreateNote(
              NoteRepositoriesImpl(
                noteDataSource: NoteDataSourceImpl(db: db),
              ),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Bloc',
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}
