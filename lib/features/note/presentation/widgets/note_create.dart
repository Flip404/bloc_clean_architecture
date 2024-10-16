import 'package:bloc_clean_architecture/features/note/domain/usercases/create_note.dart';
import 'package:bloc_clean_architecture/features/note/presentation/bloc/note_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteCreate extends StatefulWidget {
  const NoteCreate({super.key});

  @override
  State<NoteCreate> createState() => _NoteCreateState();
}

class _NoteCreateState extends State<NoteCreate> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _noteController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteBloc, NoteState>(
      listener: (context, state) {
        if (state is NoteCreateSuccessState ||
            state is NoteCreateFailureState) {
          Navigator.pop(context);
        }
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(
            16, 16, 16, MediaQuery.of(context).viewInsets.bottom),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(hintText: "Title"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Title is missing!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _noteController,
                decoration: const InputDecoration(hintText: "Note"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Note is missing!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<NoteBloc>().add(
                              CreateNoteEvent(
                                CreateNoteParam(
                                  title: _titleController.text,
                                  note: _noteController.text,
                                ),
                              ),
                            );
                      }
                    },
                    child: const Text("Save"),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
