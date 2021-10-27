import 'package:flutter/material.dart';
import 'package:notes_app/models/task.dart';

import '../../../constants.dart';

class TasksLayout extends StatefulWidget {
  TasksLayout({Key? key, required this.task, required this.color}) : super(key: key);

  final Task task;
  final int color;

  @override
  _TasksLayoutState createState() => _TasksLayoutState();
}

class _TasksLayoutState extends State<TasksLayout> {
  _setChecked(){
    setState(() {
      widget.task.state = !widget.task.state;
    });
  }

  @override
  Widget build(BuildContext context) {
    var desc = TextEditingController();
    desc.text = widget.task.description;
    return Row(
      children: [
        Transform.scale(
          scale: 1.3,
          child: Checkbox(
            value: widget.task.state,
            onChanged: (value) {_setChecked();},
            checkColor: widget.color == 2 || widget.color == 4
                ? Colors.black
                : Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            activeColor: colorsBackground[widget.color],
            //hoverColor: Colors.red,
          ),
        ),
        IntrinsicWidth(
          child: TextField(
            controller:desc,
            onChanged: (text){
              widget.task.description = text;
            },
            decoration: InputDecoration(border: InputBorder.none),
            style: TextStyle(
              fontSize: 17,
              //color: _colorText(note.color),
              decoration: widget.task.state ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }
}