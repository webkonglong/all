import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../../local_modules/px.dart';

class FoodList extends StatefulWidget {
  @override
  _FoodList createState() => _FoodList();
}

class _FoodList extends State<FoodList>
    with TickerProviderStateMixin<FoodList> {
  List<String> foodList = [];

  final foodValue = TextEditingController();

  void initState() {
    super.initState();
    _getFoodList();
  }

  _getFoodList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      foodList = (prefs.getStringList('foodList') ?? []);
    });
  }

  _del(String food) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> foods = foodList.where((item) => item != food).toList();
    prefs.setStringList('foodList', foods);
    setState(() {
      foodList = foods;
    });
  }

  _add(String food) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> foods = foodList..add(food);
    prefs.setStringList('foodList', foods);
    foodValue.clear();
    setState(() {
      foodList = foods;
    });
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

  Widget foodWidget() {
    List<Widget> foodListWidget = [];
    List<Widget> foodRowWidget = [];

    for (var i = 0; i < foodList.length; i++) {
      foodRowWidget.add(Container(
        height: Px.px(120),
        width: Px.px(330),
        margin: EdgeInsets.fromLTRB(0, 0, i % 2 == 0 ? Px.px(30) : 0, 0),
        decoration: new BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: new BorderRadius.circular(Px.px(10)),
        ),
        child: Row(
          children: [
            Container(
              width: Px.px(240),
              padding: EdgeInsets.fromLTRB(Px.px(30), 0, 0, 0),
              child: Text(
                foodList[i],
                style: TextStyle(fontSize: Px.px(30), color: Color(0xFF3A4049)),
              ),
            ),
            GestureDetector(
              child: Container(
                  width: Px.px(70),
                  child: Image.asset(
                    "images/close.png",
                    height: Px.px(40),
                    fit: BoxFit.contain,
                  )),
              onTap: () {
                _del(foodList[i]);
              },
            ),
          ],
        ),
      ));
      if (foodRowWidget.length == 2 || i == foodList.length - 1) {
        foodListWidget.add(Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, Px.px(20)),
          height: Px.px(120),
          width: Px.px(690),
          child: Row(
            children: foodRowWidget,
          ),
        ));
        foodRowWidget = [];
      }
    }
    return Column(
      children: foodListWidget,
    );
  }

  Widget addFood() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, Px.px(100), 0, 0),
      height: Px.px(120),
      width: Px.px(690),
      decoration: new BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: new BorderRadius.circular(Px.px(10)),
      ),
      child: Row(
        children: [
          Container(
            width: Px.px(500),
            padding: EdgeInsets.fromLTRB(Px.px(30), 0, 0, 0),
            child: TextField(
                controller: foodValue,
                cursorColor: const Color(0xFF3A4049),
                maxLines: 1,
                style: TextStyle(
                  color: Color(0xFF3A4049),
                  fontSize: Px.px(40),
                ),
                decoration: InputDecoration(
                  hintText: '请输饭名',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                  ),
                )),
          ),
          GestureDetector(
            child: Container(
              width: Px.px(190),
              height: Px.px(120),
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                color: Color(0xFF3A4049),
                borderRadius: new BorderRadius.circular(Px.px(10)),
              ),
              child: Text(
                '添加',
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: Px.px(40)),
              ),
            ),
            onTap: () {
              if (foodValue.text.isNotEmpty) {
                _add(foodValue.text);
              }
            },
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
              padding: EdgeInsets.fromLTRB(0, Px.px(20), 0, Px.px(50)),
              child: Column(children: [foodWidget(), addFood()]))
        ]));
  }
}
