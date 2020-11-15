import 'package:flutter/material.dart';
import '../../local_modules/px.dart';
import '../random/random.dart';

class Home extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

const apps = [
  {'name': '淘宝优惠券', 'icon': 'taobao', 'route': 1},
  {'name': '拼多多优惠券', 'icon': 'pdd', 'route': 2},
  {'name': '白噪音', 'icon': 'noise', 'route': 3},
  {'name': 'OCR文本识别', 'icon': 'ocr', 'route': 4},
  {'name': '二维码扫描', 'icon': 'discern_qr_code', 'route': 5},
  {'name': '二维码生成', 'icon': 'qr_code', 'route': 6},
  {'name': '随机数生成', 'icon': 'random', 'route': 7},
  {'name': '九格宫切图', 'icon': 'nine_pic', 'route': 8},
  {'name': '吃什么?', 'icon': 'food', 'route': 9},
  {'name': '证件照换底', 'icon': 'id_photo', 'route': 10},
  {'name': '扫描件', 'icon': 'scanning', 'route': 11},
  {'name': '排序设置', 'icon': 'set', 'route': 12},
];

class _HomePage extends State<Home> with TickerProviderStateMixin<Home> {
  ScrollController _controller = new ScrollController();
  List<Widget> routerWidget = [
    null,
    RandomApp(),
    RandomApp(),
    RandomApp(),
    RandomApp(),
    RandomApp(),
    RandomApp(),
    RandomApp(),
    RandomApp(),
    RandomApp(),
    RandomApp(),
    RandomApp(),
    RandomApp(),
  ];

  Widget appsWidget() {
    List<Widget> appsListWidget = [];
    List<Widget> appsItemWidget = [];
    for (var i = 0; i < apps.length; i++) {
      appsItemWidget.add(Expanded(
          flex: 1,
          child: GestureDetector(
            child: Container(
                height: Px.px(240),
                width: Px.px(330),
                margin:
                    EdgeInsets.fromLTRB(0, 0, i % 2 == 0 ? Px.px(30) : 0, 0),
                decoration: new BoxDecoration(
                  color: Color(0xFFFFFFFF),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, Px.px(30), 0, Px.px(14)),
                      child: Image.asset(
                        "images/home/${apps[i]['icon']}.png",
                        height: Px.px(90),
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      apps[i]['name'],
                      style: TextStyle(
                          fontSize: Px.px(32), color: Color(0xFF999999)),
                    )
                  ],
                )),
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (BuildContext context) {
                return routerWidget[apps[i]['route']];
              }));
            },
          )));

      if (appsItemWidget.length == 2) {
        appsListWidget.add(Container(
          padding: EdgeInsets.fromLTRB(Px.px(30), 0, Px.px(30), Px.px(30)),
          height: Px.px(240),
          width: Px.px(750),
          child: Row(
            children: appsItemWidget,
          ),
        ));
        appsItemWidget = [];
      }
    }

    return ListView(
      shrinkWrap: true,
      controller: _controller,
      children: appsListWidget,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, Px.px(50), 0, 0),
        child: appsWidget(),
      ),
    );
  }
}
