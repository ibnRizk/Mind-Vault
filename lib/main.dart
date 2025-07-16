import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mindvault/constant.dart';
import 'package:mindvault/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:mindvault/models/note_model.dart';
import 'package:mindvault/simple_bloc_observer.dart';
import 'package:mindvault/views/notes_view.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  await Hive.initFlutter();

  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const MindVault());
}

class MindVault extends StatelessWidget {
  const MindVault({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
      home: NotesView(),
    );
  }
}
