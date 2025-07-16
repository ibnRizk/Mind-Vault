import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindvault/cubits/notes_cubit/notes_cubit.dart';

import 'widget/add_note.dart';
import 'widget/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: const Color.fromARGB(255, 112, 161, 247),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) {
                return AddNote();
              },
            );
          },
          child: Icon(Icons.add, color: Colors.black),
        ),
        body: NotesViewBody(),
      ),
    );
  }
}
