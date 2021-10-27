import 'package:flutter/material.dart';

import '../../../constants.dart';

class TextInputLayout extends StatelessWidget {
  const TextInputLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: TextFormField(
        cursorColor: Colors.white70,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: defaultPadding),
          hintText: 'Search your notes',
          hintStyle: TextStyle(color: Colors.white38),
          fillColor: backgroundLightColor,
          filled: true,
          prefixIcon: Icon(
            Icons.list_alt_rounded,
            color: Colors.white,
          ),
          suffixIcon: Icon(
            Icons.supervised_user_circle,
            size: 40,
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent,width: 0.0),
            borderRadius: BorderRadius.circular(30)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent,width: 0.0),
            borderRadius: BorderRadius.circular(30)
          ),
        ),
      ),
    );
  }
}
