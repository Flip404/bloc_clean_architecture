import 'package:bloc_clean_architecture/core/common/widgets/loading.dart';
import 'package:bloc_clean_architecture/core/utils/bottomsheet.dart';
import 'package:bloc_clean_architecture/core/utils/show_snackbar.dart';
import 'package:bloc_clean_architecture/features/note/presentation/bloc/note_bloc.dart';
import 'package:bloc_clean_architecture/features/note/presentation/widgets/note_create.dart';
import 'package:bloc_clean_architecture/features/note/presentation/widgets/note_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<NoteBloc>().add(FetchingNoteEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note"),
      ),
      body: BlocConsumer<NoteBloc, NoteState>(
        builder: (context, state) {
          if (state is NoteLoadingState) return const Loading();

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: List.generate(
                  state.props.length,
                  (index) => NoteStyle(
                    noteEntity: state.props[index],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is NoteCreateSuccessState) {
            context.read<NoteBloc>().add(FetchingNoteEvent());
          } else if (state is NoteCreateFailureState) {
            showSnackBar(
              context,
              state.message,
              Theme.of(context).colorScheme.error,
              Theme.of(context).colorScheme.onError,
            );
          } else if (state is NoteFetchFailureState) {
            showSnackBar(
              context,
              state.message,
              Theme.of(context).colorScheme.error,
              Theme.of(context).colorScheme.onError,
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bottomSheet(
          context: context,
          widget: const NoteCreate(),
          isScrollControlled: true,
        ),
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
