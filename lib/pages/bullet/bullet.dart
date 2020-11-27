import 'package:flutter/material.dart';
import '../../local_modules/px.dart';
import '../../components/title.dart';
import './roll.dart';

class Bullet extends StatefulWidget {
  @override
  _Bullet createState() => _Bullet();
}

class _Bullet extends State<Bullet> with TickerProviderStateMixin<Bullet> {
  int backgroundColor = 0xFF3A4049;
  int backgroundColorIndex = 0;
  int textColor = 0xFFF5BC56;
  int textColorIndex = 2;
  TextEditingController textareaValue;
  String text = '微信：AAAbbbCCC';
  List<int> colorList = [
    0xFF3A4049,
    0xFFE45D5E,
    0xFFF5BC56,
    0xFF23A47E,
    0xFF1B77FC,
    0xFF8509FB
  ];

  @override
  void initState() {
    super.initState();
    textareaValue = new TextEditingController(text: text);
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

  Widget displayWidget() {
    return Container(
      height: Px.px(400),
      width: Px.px(690),
      margin: EdgeInsets.fromLTRB(0, 0, 0, Px.px(20)),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            width: Px.px(690),
            height: Px.px(350),
            decoration: new BoxDecoration(
              color: Color(backgroundColor),
              borderRadius: new BorderRadius.circular(Px.px(20)),
            ),
            child: Text(
              text,
              style: TextStyle(
                  color: Color(textColor),
                  fontSize: Px.px(50),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: Px.px(0),
            left: Px.px(295),
            child: GestureDetector(
              child: Container(
                width: Px.px(100),
                height: Px.px(100),
                decoration: new BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: new BorderRadius.circular(Px.px(50)),
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  "images/full_screen.png",
                  height: Px.px(60),
                  fit: BoxFit.contain,
                ),
              ),
              onTap: () => {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (BuildContext context) {
                  return Roll(
                      backgroundColor: backgroundColor,
                      textColor: textColor,
                      text: text);
                }))
              },
            ),
          )
        ],
      ),
    );
  }

  Widget textarea() {
    return Container(
      width: Px.px(690),
      height: Px.px(200),
      padding: EdgeInsets.fromLTRB(Px.px(20), Px.px(10), Px.px(20), Px.px(10)),
      margin: EdgeInsets.fromLTRB(0, 0, 0, Px.px(30)),
      decoration: new BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: new BorderRadius.circular(Px.px(20))),
      child: TextField(
        controller: textareaValue,
        cursorColor: const Color(0xFF3A4049),
        maxLines: null,
        style: TextStyle(
          color: Color(0xFF3A4049),
          fontSize: Px.px(40),
        ),
        decoration: InputDecoration(
          hintText: '请输入或粘贴内容',
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
          ),
        ),
        onChanged: (value) {
          setState(() {
            text = value;
          });
        },
      ),
    );
  }

  Widget selectWidget(text, index, callback) {
    List<Widget> colorWidget = [];
    for (var i = 0; i < colorList.length; i++) {
      colorWidget.add(
        GestureDetector(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(
                0, 0, Px.px(i == colorList.length - 1 ? 0 : 36), 0),
            width: Px.px(50),
            height: Px.px(50),
            decoration: new BoxDecoration(
              color: Color(colorList[i]),
              borderRadius: new BorderRadius.circular(Px.px(25)),
            ),
            child: index == i
                ? Image.asset(
                    "images/check.png",
                    height: Px.px(40),
                    fit: BoxFit.contain,
                  )
                : Container(),
          ),
          onTap: () {
            callback(i);
          },
        ),
      );
    }

    return Container(
      width: Px.px(690),
      height: Px.px(100),
      padding: EdgeInsets.fromLTRB(Px.px(30), 0, Px.px(30), 0),
      margin: EdgeInsets.fromLTRB(0, 0, 0, Px.px(30)),
      decoration: new BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: new BorderRadius.circular(Px.px(20)),
      ),
      child: Row(
        children: [
          Container(
            width: Px.px(150),
            child: Text(
              text,
              style: TextStyle(color: Color(0xFF3A4049), fontSize: Px.px(40)),
            ),
          ),
          Container(
            width: Px.px(480),
            child: Row(
              children: colorWidget,
            ),
          )
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF4F4F3),
        appBar: appBarWidget(),
        body: ListView(children: [
          Container(
              child: Column(children: [
            AppTitle('手持弹幕'),
            displayWidget(),
            textarea(),
            selectWidget('字体色', textColorIndex, (index) {
              setState(() {
                textColorIndex = index;
                textColor = colorList[index];
              });
            }),
            selectWidget('背景色', backgroundColorIndex, (index) {
              setState(() {
                backgroundColorIndex = index;
                backgroundColor = colorList[index];
              });
            })
          ]))
        ]));
  }
}
