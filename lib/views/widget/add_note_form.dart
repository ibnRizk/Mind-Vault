import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mindvault/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:mindvault/models/note_model.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

final GlobalKey<FormState> FormKey = GlobalKey();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
String? title, subTitle;

class _AddNoteFormState extends State<AddNoteForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: FormKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(height: 32),
          CustomTextField(
            hint: 'Title',
            onsaved: (p0) {
              title = p0;
            },
          ),
          SizedBox(height: 16),
          CustomTextField(
            hint: 'content',
            maxSize: 5,
            onsaved: (p0) {
              subTitle = p0;
            },
          ),
          SizedBox(height: 32),

          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                ontap: () {
                  if (FormKey.currentState!.validate()) {
                    FormKey.currentState!.save();
                    var currentDate = DateTime.now();

                    var formattedCurrentDate = DateFormat(
                      'dd-mm-yyyy',
                    ).format(currentDate);
                    var noteModel = NoteModel(
                      title: title!,
                      subTitle: subTitle!,
                      data: formattedCurrentDate,
                      color: Colors.red.value,
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
