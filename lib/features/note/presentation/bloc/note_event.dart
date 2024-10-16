part of 'note_bloc.dart';

sealed class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class FetchingNoteEvent extends NoteEvent {}

class CreateNoteEvent extends NoteEvent {
  final CreateNoteParam param;

  const CreateNoteEvent(this.param);
}
