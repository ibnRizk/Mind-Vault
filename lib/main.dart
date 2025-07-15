import 'package:flutter/material.dart';
import 'package:mindvault/views/notes_view.dart';

void main() {
  runApp(const MindVault());
}

class MindVault extends StatelessWidget {
  const MindVault({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(), home: NotesView());
  }
}
