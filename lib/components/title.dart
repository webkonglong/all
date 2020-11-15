import 'package:flutter/material.dart';
import '../local_modules/px.dart';

class AppTitle extends StatelessWidget {
  dynamic title;
  AppTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, Px.px(30)),
      child: Text(title,
          style: TextStyle(color: Color(0xFF3A4049), fontSize: Px.px(60))),
    );
  }
}
