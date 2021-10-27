import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/task.dart';
import 'package:notes_app/screens/home/componets/body_home.dart';
import 'package:notes_app/screens/home/componets/bottom_navigation_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSelectedSwitch = true;
  

  void _changeSwitchState() {
    setState(() {
      _isSelectedSwitch = !_isSelectedSwitch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          systemNavigationBarColor: backgroundLightColor,
          statusBarIconBrightness: Brightness.light,),
      child: Scaffold(
        extendBody: true,
        backgroundColor: backgroundDarkColor,
        appBar: _buildAppBar(),
        body: BodyHome(),
        bottomNavigationBar: BottomNavigationLayout(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
            size: 30,
          ),
          elevation: 10,
          backgroundColor: Colors.blue,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Padding(
        padding:
            const EdgeInsets.only(left: defaultPadding, top: defaultPadding),
        child: Text(
          "Notes",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      elevation: 0,
      backgroundColor: backgroundDarkColor,
      actions: [
        Padding(
          padding:
              const EdgeInsets.only(right: defaultPadding, top: defaultPadding),
          child: CupertinoSwitch(
            value: _isSelectedSwitch,
            onChanged: (value) {
              _changeSwitchState();
            },
            activeColor: backgroundLightColor,
            trackColor: Colors.white,
          ),
        )
      ],
    );
  }
}
