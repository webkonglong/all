import 'package:flutter/material.dart';
import '../../local_modules/px.dart';

class Home extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

const apps = [
  {'name': '淘宝优惠券', 'icon': 'taobao', 'route': ''},
  {'name': '拼多多优惠券', 'icon': 'pdd', 'route': ''},
  {'name': '白噪音', 'icon': 'noise', 'route': ''},
  {'name': 'OCR文本识别', 'icon': 'ocr', 'route': ''},
  {'name': '二维码扫描', 'icon': 'discern_qr_code', 'route': ''},
  {'name': '二维码生成', 'icon': 'qr_code', 'route': ''},
  {'name': '随机数生成', 'icon': 'random', 'route': ''},
  {'name': '九格宫切图', 'icon': 'nine_pic', 'route': ''},
  {'name': '吃什么', 'icon': 'food', 'route': ''},
  {'name': '证件照换底', 'icon': 'id_photo', 'route': ''},
  {'name': '扫描件', 'icon': 'scanning', 'route': ''},
  {'name': '更多开发中...', 'icon': 'more', 'route': ''},
];

class _HomePage extends State<Home> with TickerProviderStateMixin<Home> {
  ScrollController _controller = new ScrollController();

  Widget appsWidget() {
    List<Widget> appsListWidget = [];
    List<Widget> appsItemWidget = [];
    for (var i = 0; i < apps.length; i++) {
      appsItemWidget.add(Expanded(
        flex: 1,
        child: Container(
            height: Px.px(240),
            width: Px.px(330),
            margin: EdgeInsets.fromLTRB(0, 0, i % 2 == 0 ? Px.px(30) : 0, 0),
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
                  style:
                      TextStyle(fontSize: Px.px(32), color: Color(0xFF999999)),
                )
              ],
            )),
      ));

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
