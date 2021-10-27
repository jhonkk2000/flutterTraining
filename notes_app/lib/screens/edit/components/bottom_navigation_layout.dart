import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note.dart';

class BottomNavigationLayout extends StatefulWidget {
  const BottomNavigationLayout({
    Key? key,
    required this.note, required this.changeColor,
  }) : super(key: key);

  final Note note;
  final Function changeColor;

  @override
  _BottomNavigationLayoutState createState() => _BottomNavigationLayoutState();
}

class _BottomNavigationLayoutState extends State<BottomNavigationLayout>
    with TickerProviderStateMixin {
  bool _isExpanded = false;

  _setExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    int _posColor = widget.note.color;
    int _newColor = 0;
    return BottomAppBar(
      child: AnimatedSize(
        vsync: this,
        duration: Duration(milliseconds: 150),
        alignment: AlignmentDirectional.bottomCenter,
        curve: Curves.bounceIn,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundLightColor,
            borderRadius: _isExpanded
                ? BorderRadius.only(
                    topLeft: Radius.circular(30), topRight: Radius.circular(30))
                : BorderRadius.all(Radius.zero),
          ),
          height: _isExpanded
              ? kBottomNavigationBarHeight * 5.8
              : kBottomNavigationBarHeight,
          child: _isExpanded
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (var i = 0; i < colorsBackground.length; i++)
                            _colorPallette(colorsBackground[i], i),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _buildOption("Delete note", Icons.delete_outline_rounded),
                    _buildOption("Make a copy", Icons.copy_all_rounded),
                    _buildOption("Share", Icons.share_outlined),
                    _buildOption(
                        "Labes", Icons.label_important_outline_rounded),
                    _showShort(Icons.arrow_circle_down_outlined)
                  ],
                )
              : _showShort(Icons.arrow_circle_up_outlined),
        ),
      ),
    );
  }

  Widget _colorPallette(Color color, int pos) {
    return InkWell(
      onTap: (){widget.changeColor(pos);},
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.all(3),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: color,
          ),
          child: colorsBackground[widget.note.color] == color
              ? Icon(Icons.check)
              : Container(),
        ),
      ),
    );
  }

  SizedBox _buildOption(String label, IconData icon) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.only(left: defaultPadding),
              width: kBottomNavigationBarHeight,
              child: Icon(
                icon,
                size: 30,
                color: Colors.white,
              )),
          Text(
            label,
            style: TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Row _showShort(IconData icon) {
    return Row(
      children: [
        SizedBox(
          width: defaultPadding,
        ),
        InkWell(
          hoverColor: Colors.white,
          onTap: () {
            _setExpanded();
          },
          child: Container(
            height: kBottomNavigationBarHeight,
            width: kBottomNavigationBarHeight,
            //color: Colors.blueAccent,
            child: Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 60,
        ),
        Text(
          "Sun, 16:32 | 4096 characters",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70),
        ),
      ],
    );
  }
}
