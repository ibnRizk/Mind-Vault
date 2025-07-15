import 'package:flutter/material.dart';

import 'widget/add_note.dart';
import 'widget/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotesViewBody(),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: const Color.fromARGB(255, 112, 161, 247),
        onPressed: () {
          showBottomSheet(
            context: context,
            builder: (context) {
              return AddNote();
            },
          );
        },
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
