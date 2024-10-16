part of 'note_bloc.dart';

sealed class NoteState extends Equatable {
  const NoteState();

  @override
  List<NoteEntity> get props => [];
}

final class NoteInitialState extends NoteState {}

final class NoteLoadingState extends NoteState {}

final class NoteFetchSuccessState extends NoteState {
  final List<NoteEntity> notes;
  const NoteFetchSuccessState({required this.notes});

  @override
  List<NoteEntity> get props => notes;
}

final class NoteFetchFailureState extends NoteState {
  final String message;
  const NoteFetchFailureState({required this.message});
}

final class NoteCreateSuccessState extends NoteState {}

final class NoteCreateFailureState extends NoteState {
  final String message;
  const NoteCreateFailureState({required this.message});
}
