import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mindvault/views/notes_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(const MindVault());
}

class MindVault extends StatelessWidget {
  const MindVault({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
      home: NotesView(),
    );
  }
}
