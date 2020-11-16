import 'package:flutter/material.dart';
import '../local_modules/px.dart';

class Button extends StatelessWidget {
  Button({Key key, this.text, this.callback, this.leftText, this.leftCallback});

  final String text;
  final String leftText;
  final Function callback;
  final Function leftCallback;

  Widget button(int width, String text, Function callback, int margin) {
    return GestureDetector(
      child: Container(
        height: Px.px(140),
        width: Px.px(width),
        margin: EdgeInsets.fromLTRB(0, 0, Px.px(margin), 0),
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

  @override
  Widget build(BuildContext context) {
    return leftText != ''
        ? Container(
            child: Row(
              children: [
                button(220, leftText, leftCallback, 20),
                button(400, text, callback, 0),
              ],
            ),
          )
        : button(640, text, callback, 0);
  }
}
