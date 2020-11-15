import 'package:flutter/material.dart';
import '../local_modules/px.dart';

class Button extends StatelessWidget {
  Button({Key key, this.text, this.callback});

  final String text;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: Px.px(140),
        width: Px.px(690),
        alignment: Alignment.center,
        decoration: new BoxDecoration(
            color: Color(0xFF3A4049),
            borderRadius: new BorderRadius.circular(Px.px(25))),
        child: Text(
          text,
          style: TextStyle(color: Color(0xFFFFFFFF), fontSize: Px.px(50)),
        ),
      ),
      onTap: () {
        callback();
      },
    );
  }
}
