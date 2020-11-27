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

  Timer outtTime;

  void rollFn() {
    if (_controller != null) {
      _controller.jumpTo(_controller.position.minScrollExtent);
      _controller.animateTo(_controller.position.maxScrollExtent,
          duration: Duration(milliseconds: 4000), curve: Curves.linear);
    }
  }

  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    OrientationPlugin.forceOrientation(DeviceOrientation.landscapeLeft);

    Timer(Duration(milliseconds: 200), () {
      rollFn();
    });

    outtTime = Timer.periodic(Duration(milliseconds: 4000), (timer) {
      rollFn();
    });

    return Scaffold(
        backgroundColor: Color(widget.backgroundColor),
        body: Container(
          alignment: Alignment.center,
          child: Stack(
            children: [
              ListView(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.fromLTRB(Px.screenH(), 0, Px.screenH(), 0),
                      child: Text(
                        widget.text,
                        style: TextStyle(
                            color: Color(widget.textColor),
                            fontWeight: FontWeight.bold,
                            wordSpacing: Px.px(750),
                            fontSize: Px.px(600)),
                      ),
                    )
                  ]),
              Positioned(
                top: Px.px(30),
                left: Px.px(30),
                child: GestureDetector(
                  child: Image.asset(
                    "images/while_out.png",
                    height: Px.px(30),
                    fit: BoxFit.contain,
                  ),
                  onTap: () {
                    outtTime.cancel();
                    outtTime = null;
                    _controller = null;
                    OrientationPlugin.forceOrientation(
                        DeviceOrientation.portraitUp);
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        ));
  }
}
