import 'package:flutter/material.dart';
import '../../local_modules/px.dart';
import 'dart:math';
import '../../components/title.dart';
import '../../components/button.dart';

class Props {
  final String text;
  final Function callback; //商品描述
  Props(this.text, this.callback);
}

class RandomApp extends StatefulWidget {
  @override
  _Random createState() => _Random();
}

class _Random extends State<RandomApp>
    with TickerProviderStateMixin<RandomApp> {
  int _random = 0;
  TextEditingController startRandom;
  TextEditingController endRandom;

  var rng = new Random();
  int createRandom(int min, int max) => min + rng.nextInt(max - min);

  @override
  void initState() {
    super.initState();
    startRandom = new TextEditingController(text: '0');
    endRandom = new TextEditingController(text: '100');
  }

  Widget appBarWidget() {
    return AppBar(
      backgroundColor: Color(0xFFF4F4F3),
      elevation: 0,
      leading: IconButton(
        icon: Image.asset(
          "images/out.png",
          height: Px.px(60),
          fit: BoxFit.contain,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget titleWidget() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, Px.px(30)),
      child: Text("随机数",
          style: TextStyle(color: Color(0xFF3A4049), fontSize: Px.px(60))),
    );
  }

  Widget resultWidget() {
    return Container(
      width: Px.px(690),
      height: Px.px(400),
      decoration: new BoxDecoration(
          color: Color(0xFF3A4049),
          borderRadius: new BorderRadius.circular(Px.px(30))),
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(0, 0, 0, Px.px(30)),
      child: Text(
        '${_random}',
        style: TextStyle(color: Color(0xFFFFFFFF), fontSize: Px.px(150)),
      ),
    );
  }

  Widget conditionWidget() {
    return Container(
        width: Px.px(690),
        height: Px.px(270),
        margin: EdgeInsets.fromLTRB(0, 0, 0, Px.px(30)),
        padding: EdgeInsets.all(Px.px(30)),
        decoration: new BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: new BorderRadius.circular(Px.px(30))),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(0, 0, 0, Px.px(30)),
              child: Text(
                "随机数区间",
                style: TextStyle(color: Color(0xFF3A4049), fontSize: Px.px(50)),
              ),
            ),
            Row(children: [
              Container(
                width: Px.px(200),
                height: Px.px(100),
                child: TextField(
                    controller: startRandom,
                    keyboardType: TextInputType.number,
                    cursorColor: const Color(0xFF3A4049),
                    style: TextStyle(
                      color: Color(0xFF3A4049),
                      fontSize: Px.px(40),
                    ),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF3A4049)),
                      ),
                    )),
              ),
              Container(
                width: Px.px(180),
                alignment: Alignment.center,
                child: Text(
                  '——',
                  style: TextStyle(color: Color(0xFF3A4049)),
                ),
              ),
              Container(
                width: Px.px(200),
                height: Px.px(100),
                child: TextField(
                    controller: endRandom,
                    keyboardType: TextInputType.number,
                    cursorColor: const Color(0xFF3A4049),
                    style: new TextStyle(
                      color: const Color(0xFF3A4049),
                      fontSize: Px.px(40),
                    ),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF3A4049)),
                      ),
                    )),
              )
            ]),
          ],
        ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF4F4F3),
        appBar: appBarWidget(),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all((30)),
              child: Column(
                children: [
                  AppTitle('随机数'),
                  resultWidget(),
                  conditionWidget(),
                  Button(
                      text: '生成随机数',
                      callback: () {
                        setState(() {
                          _random = createRandom(int.parse(startRandom.text),
                              int.parse(endRandom.text) + 1);
                        });
                      })
                ],
              ),
            )
          ],
        ));
  }
}
