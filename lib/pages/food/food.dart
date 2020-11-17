import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import '../../local_modules/px.dart';
import '../../components/title.dart';
import '../../components/button.dart';
import './foodlist.dart';

List<String> defaultFoodList = [
  "盖浇饭",
  "砂锅",
  "大排档",
  "米线",
  "满汉全席",
  "西餐",
  "麻辣烫",
  "自助餐",
  "炒面",
  "快餐",
  "水果",
  "西北风",
  "馄饨",
  "火锅",
  "烧烤",
  "泡面",
  "速冻水饺",
  "日本料理",
  "涮羊肉",
  "味千拉面",
  "肯德基",
  "面包",
  "扬州炒饭",
  "自助餐",
  "茶餐厅",
  "海底捞",
  "咖啡",
  "比萨",
  "麦当劳",
  "兰州拉面",
  "沙县小吃",
  "烤鱼",
  "海鲜",
  "铁板烧",
  "韩国料理",
  "粥",
  "快餐",
  "萨莉亚",
  "桂林米粉",
  "东南亚菜",
  "甜点",
  "农家菜",
  "川菜",
  "粤菜",
  "湘菜",
  "本帮菜",
  "竹笋烤肉"
];

class Food extends StatefulWidget {
  @override
  _Food createState() => _Food();
}

class _Food extends State<Food> with TickerProviderStateMixin<Food> {
  int resultIndex;
  List<String> foodList = [];
  var rng = new Random();

  void didChangeDependencies() {
    super.didChangeDependencies();
    _getFoodList();
  }

  _getFoodList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('foodList') == null) {
      prefs.setStringList('foodList', defaultFoodList);
    }
    print(prefs.getStringList('foodList'));
    setState(() {
      foodList = prefs.getStringList('foodList') == null
          ? defaultFoodList
          : (prefs.getStringList('foodList') ?? []);
    });
  }

  int createRandom(int min, int max) => min + rng.nextInt(max - min);

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

  Widget resultWidget() {
    return Container(
      width: Px.px(690),
      height: Px.px(400),
      decoration: new BoxDecoration(
          color: Color(0xFF3A4049),
          borderRadius: new BorderRadius.circular(Px.px(30))),
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(0, 0, 0, Px.px(60)),
      child: Text(
        "${resultIndex == null ? '?' : foodList[resultIndex]}",
        style: TextStyle(color: Color(0xFFFFFFFF), fontSize: Px.px(70)),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF4F4F3),
        appBar: appBarWidget(),
        body: ListView(children: [
          Container(
              padding: EdgeInsets.all((30)),
              child: Column(children: [
                AppTitle('吃什么?'),
                resultWidget(),
                Button(
                  text: '吃什么?',
                  leftText: '菜单',
                  callback: () {
                    setState(() {
                      resultIndex = createRandom(0, foodList.length);
                    });
                  },
                  leftCallback: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) => FoodList()));
                  },
                )
              ]))
        ]));
  }
}
