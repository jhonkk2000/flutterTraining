import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/screens/edit/components/body_edit.dart';

import 'components/bottom_navigation_layout.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key, required this.note}) : super(key: key);

  final Note note;

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final dbr = FirebaseDatabase.instance.reference();

  _buildIcon(IconData iconData, VoidCallback press) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Icon(
          iconData,
          size: 30,
          color: colorsBackground[widget.note.color],
        ),
      ),
    );
  }

  void _changeColor(int pos) {
    setState(() {
      widget.note.color = pos;
    });
  }

  void _saveData(BuildContext context) {
    dbr.child("notes").child(widget.note.id).set(widget.note.toJson());
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          systemNavigationBarColor: backgroundLightColor,statusBarColor: Colors.transparent),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
            leading: InkWell(
                onTap: () {
                  _saveData(context);
                },
                child: Icon(Icons.arrow_back_rounded,
                    color: colorsBackground[widget.note.color])),
            elevation: 0,
            backgroundColor: Colors.white,
            actions: [
              _buildIcon(Icons.undo_outlined, () {}),
              _buildIcon(Icons.redo_outlined, () {}),
              _buildIcon(Icons.check_circle_outline_rounded, () {
                _saveData(context);
              }),
            ],
          ),
          body: BodyEdit(
            note: widget.note,
          ),
          bottomNavigationBar: BottomNavigationLayout(
            note: widget.note,
            changeColor: (int pos) {
              _changeColor(pos);
            },
          )),
    );
  }
}
