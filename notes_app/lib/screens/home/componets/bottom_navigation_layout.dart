import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class BottomNavigationLayout extends StatelessWidget {
  const BottomNavigationLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 20,
            spreadRadius: 20,
          ),
        ],
      ),
      child: BottomAppBar(
        color: backgroundLightColor,
        elevation: 8,
        child: Container(
          height: kBottomNavigationBarHeight*7/6,
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildIcon(Icons.add_task_outlined),
              _buildIcon(Icons.settings_voice_outlined),
              _buildIcon(Icons.camera_alt_outlined),
              _buildIcon(Icons.format_paint_outlined),
            ],
          ),
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }

  _buildIcon(IconData iconData) {
    return Padding(
      padding: const EdgeInsets.only(top: 5,bottom: 5),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
            padding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Container(
            height: kBottomNavigationBarHeight,
            width: kBottomNavigationBarHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              //color: Colors.blue,
            ),
            child: Icon(
              iconData,
              color: Colors.white,
              size: 25,
            ),
          )),
    );
  }
}
