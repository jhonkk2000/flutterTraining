import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/models/task.dart';
import 'package:notes_app/screens/edit/components/tasks_layout.dart';
import 'package:notes_app/screens/edit/components/text_description.dart';

class BodyEdit extends StatefulWidget {
  const BodyEdit({Key? key, required this.note}) : super(key: key);
  final Note note;

  @override
  _BodyEditState createState() => _BodyEditState();
}

class _BodyEditState extends State<BodyEdit> {
  final fb = FirebaseDatabase.instance;

  _addTask() {
    setState(() {
      widget.note.tasks.add(Task(state: false, description: "Write your task"));
    });
  }

  @override
  Widget build(BuildContext context) {
    var titleText = TextEditingController();
    titleText.text = widget.note.title;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(
            left: defaultPadding + 5, right: defaultPadding + 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: widget.note.image != ""
                  ? Hero(
                      tag: widget.note.title,
                      child: Image.asset(
                        widget.note.image,
                      ),
                    )
                  : Container(),
              borderRadius: BorderRadius.circular(20),
            ),
            IntrinsicWidth(
              child: TextField(
                controller: titleText,
                onChanged: (text) {
                  widget.note.title = text;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Sun, 16:32 | 4096 characters",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
            SizedBox(
              height: 15,
            ),
            TextDescription(note: widget.note),
            SizedBox(
              height: 15,
            ),
            for (Task task in widget.note.tasks)
              TasksLayout(task: task, color: widget.note.color),
            _buildNewTask()
          ],
        ),
      ),
    );
  }

  InkWell _buildNewTask() {
    final ref = fb.reference();
    return InkWell(
      onTap: () {
        _addTask();
        //print(widget.note.toJson());
        //ref.child("notes").push().set(widget.note.toJson());
        //ref.child("notes").once().then((value) => print(value.key));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 9),
        width: 200,
        //color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.add_circle_outline,
              color: colorsBackground[widget.note.color],
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Add new task",
              style: TextStyle(fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}
