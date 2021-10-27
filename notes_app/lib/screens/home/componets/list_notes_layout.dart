import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/models/task.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_app/screens/edit/edit_screen.dart';

class ListNotesLayout extends StatefulWidget {
  const ListNotesLayout({
    Key? key,
  }) : super(key: key);

  @override
  _ListNotesLayoutState createState() => _ListNotesLayoutState();
}

class _ListNotesLayoutState extends State<ListNotesLayout> {
  Color _colorText(int index) =>
      index == 2 || index == 4 ? Colors.black54 : Colors.white70;

  final dbr = FirebaseDatabase.instance.reference();
  final Future<FirebaseApp> _future = Firebase.initializeApp();
  List<Note> _notes = [];
  bool _isLoadData = false;

  void _readData() {
    dbr.onValue.listen((value) {
      _notes.clear();
      var mapOfMaps = Map<dynamic, dynamic>.from(value.snapshot.value['notes']);
      mapOfMaps.values.forEach((element) {
        List<Task> tasks = [];
        for (var item in element['tasks']) {
          tasks.add(Task.fromJson(item));
        }
        print(tasks.length);
        _notes.add(Note.fromJson(Map<dynamic, dynamic>.from(element), tasks));
      });
      setState(() {});
      print(_notes.length);
    });    
  }

  void _updateData(){
    dbr.onValue.listen((event) {
      print(event.snapshot.value['notes']);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoadData) {
      _isLoadData = true;
      _readData();
    }
    //_updateData();
    return _buildBodyList();
  }

  Container _buildBodyList() {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding * 5),
      child: StaggeredGridView.countBuilder(
        physics: BouncingScrollPhysics(),
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
                left: defaultPadding / 2,
                right: defaultPadding / 2,
                bottom: defaultPadding),
            child: Wrap(children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditScreen(
                        note: _notes[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: colorsBackground[_notes[index].color],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildImage(index),
                      _buildTitle(index),
                      _buildDescription(index),
                      for (Task task in _notes[index].tasks)
                        _buildCheckbox(index, task),
                      _buildTagAndLastUpdate(index)
                    ],
                  ),
                ),
              ),
            ]),
          );
        },
        crossAxisCount: 4,
        staggeredTileBuilder: (int index) {
          return StaggeredTile.fit(2);
        },
      ),
    );
  }

  Padding _buildTagAndLastUpdate(int index) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        children: [
          Container(
            child: Text(
              _notes[index].category.description,
              style: TextStyle(
                color: _colorText(_notes[index].color),
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(color: _colorText(_notes[index].color)),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.only(
                top: defaultPadding / 2,
                bottom: defaultPadding / 2,
                left: defaultPadding,
                right: defaultPadding),
          ),
          Expanded(child: Container()),
          Text(
            "Sun, 16:32",
            style:
                TextStyle(color: _colorText(_notes[index].color), fontSize: 14),
          )
        ],
      ),
    );
  }

  ClipRRect _buildImage(int index) {
    return ClipRRect(
      child: _notes[index].image != ""
          ? Hero(
              tag: _notes[index].title,
              child: Image.asset(
                _notes[index].image,
              ),
            )
          : Container(),
      borderRadius: BorderRadius.circular(20),
    );
  }

  Padding _buildDescription(int index) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Text(
        _notes[index].description,
        style: TextStyle(color: _colorText(_notes[index].color)),
      ),
    );
  }

  Padding _buildTitle(int index) {
    return Padding(
      padding: const EdgeInsets.only(
        top: defaultPadding,
        left: defaultPadding,
      ),
      child: Text(
        _notes[index].title,
        style: TextStyle(
          color: _notes[index].color == 2 || _notes[index].color == 4
              ? Colors.black
              : Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _buildCheckbox(int index, Task task) {
    return Row(
      children: [
        SizedBox(
          height: 30,
          child: Checkbox(
            value: task.state,
            onChanged: (value) {},
            checkColor: _notes[index].color == 2 || _notes[index].color == 4
                ? Colors.white
                : Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            activeColor: _notes[index].color == 2 || _notes[index].color == 4
                ? Colors.black
                : Colors.white,
            //hoverColor: Colors.red,
          ),
        ),
        Text(
          task.description,
          style: TextStyle(
            fontSize: 15,
            color: _colorText(_notes[index].color),
            decoration:
                task.state ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
      ],
    );
  }
}
