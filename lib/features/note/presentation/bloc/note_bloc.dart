import 'package:bloc_clean_architecture/core/usecase/usecase.dart';
import 'package:bloc_clean_architecture/features/note/domain/entities/note_entities.dart';
import 'package:bloc_clean_architecture/features/note/domain/usercases/create_note.dart';
import 'package:bloc_clean_architecture/features/note/domain/usercases/get_all_notes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final GetAllNotes _getAllNotes;
  final CreateNote _createNote;

  NoteBloc({
    required GetAllNotes getAllNote,
    required CreateNote createNote,
  })  : _getAllNotes = getAllNote,
        _createNote = createNote,
        super(NoteInitialState()) {
    on<NoteEvent>((event, emit) => emit(NoteLoadingState()));
    on<FetchingNoteEvent>((event, emit) => _fetchingNote(emit));
    on<CreateNoteEvent>((event, emit) => _createNoteFunction(event, emit));
  }

  void _fetchingNote(Emitter<NoteState> emit) async {
    emit(NoteLoadingState());

    final result = await _getAllNotes.call(NoParam());

    result.fold(
      (f) => emit(NoteFetchFailureState(message: f.errorMessage)),
      (s) => emit(NoteFetchSuccessState(notes: s)),
    );
  }

  void _createNoteFunction(
      CreateNoteEvent event, Emitter<NoteState> emit) async {
    final result = await _createNote.call(event.param);

    result.fold(
      (f) => emit(NoteCreateFailureState(message: f.errorMessage)),
      (s) => emit(NoteCreateSuccessState()),
    );
  }
}
