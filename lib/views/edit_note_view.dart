import 'package:flutter/material.dart';
import 'package:mindvault/models/note_model.dart';

import 'widget/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EditNoteViewBody(noteModel: noteModel));
  }
}
