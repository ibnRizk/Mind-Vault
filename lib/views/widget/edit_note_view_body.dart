import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindvault/cubits/notes_cubit/notes_cubit.dart';
import 'package:mindvault/views/widget/custom_app_bar.dart';
import 'package:mindvault/views/widget/custom_text_field.dart';

import '../../models/note_model.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

String? title, subTitle;

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 50),
          CustomAppBar(
            onpressed: () {
              widget.noteModel.title = title ?? widget.noteModel.title;
              widget.noteModel.subTitle = subTitle ?? widget.noteModel.subTitle;
              widget.noteModel.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();

              Navigator.pop(context);
            },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          SizedBox(height: 50),

          CustomTextField(
            onchanged: (p0) {
              title = p0;
            },
            hint: widget.noteModel.title,
          ),
          SizedBox(height: 16),
          CustomTextField(
            onchanged: (p0) {
              subTitle = p0;
            },
            hint: widget.noteModel.subTitle,
            maxSize: 5,
          ),
        ],
      ),
    );
  }
}
