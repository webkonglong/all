import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orientation/orientation.dart';
import '../../local_modules/px.dart';
import 'dart:async';

class Roll extends StatefulWidget {
  Roll({Key key, this.backgroundColor, this.textColor, this.text});
  final int backgroundColor;
  final int textColor;
  final String text;

  @override
  _Roll createState() => _Roll();
}

class _Roll extends State<Roll> with TickerProviderStateMixin<Roll> {
  ScrollController _controller = ScrollController();

  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    OrientationPlugin.forceOrientation(DeviceOrientation.landscapeLeft);

    Timer(Duration(milliseconds: 500), () {
      // _controller.jumpTo(_controller.position.maxScrollExtent, duration: Duration(milliseconds: 200));
      _controller.animateTo(
        _controller.position.maxScrollExtent,
        // 返回顶部的过程中执行一个滚动动画，动画时间是200毫秒，动画曲线是Curves.ease
        duration: Duration(milliseconds: 5000),
        curve: Curves.ease,
      );
    });

    return Scaffold(
        backgroundColor: Color(widget.backgroundColor),
        body: Container(
          alignment: Alignment.center,
          child: ListView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              children: [
                Text(
                  widget.text,
                  style: TextStyle(
                      color: Color(widget.textColor),
                      fontWeight: FontWeight.bold,
                      wordSpacing: Px.px(750),
                      fontSize: Px.px(600)),
                ),
              ]),
        ));
  }
}
