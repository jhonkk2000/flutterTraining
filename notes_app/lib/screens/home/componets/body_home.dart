import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/screens/home/componets/text_input_layout.dart';

import 'list_notes_layout.dart';

class BodyHome extends StatelessWidget {
  BodyHome({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextInputLayout(),
        ListNotesLayout(),
      ],
    );
  }
}
