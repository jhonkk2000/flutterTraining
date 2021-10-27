import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';

import '../../../constants.dart';

class TextDescription extends StatelessWidget {
  const TextDescription({
    Key? key,
    required this.note,
  }) : super(key: key);

  final Note note;

  @override
  Widget build(BuildContext context) {
    var desc = TextEditingController();
    desc.text = note.description;
    return Container(
      decoration: BoxDecoration(
        border: Border(
            left: BorderSide(width: 3.5, color: colorsBackground[note.color])),
      ),
      padding: const EdgeInsets.only(left: defaultPadding),
      child: TextField(
        maxLines: null,
        onChanged: (text){
          note.description=text;
        },
        style: TextStyle(fontSize: 16, height: 1.5),
        controller: desc,
        decoration: InputDecoration(
            border: InputBorder.none, hintText: 'Enter your text here'),
      ),
    );
  }
}
