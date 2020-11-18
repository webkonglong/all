import 'package:flutter/material.dart';
import './local_modules/px.dart';
import 'pages/home/home.dart';
import 'pages/random/random.dart';
import 'pages/createCode/createCode.dart';
import 'pages/food/food.dart';
import 'pages/food/foodlist.dart';
import 'pages/bullet/bullet.dart';

class HomeRouter extends StatefulWidget {
  @override
  RouterState createState() {
    return RouterState();
  }
}

class RouterState extends State<HomeRouter> {
  final List<Widget> list = List();
  int _currentIndex = 0;

  @override
  void initState() {
    list..add(Home())..add(Home());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Color(0xFFFBFBFB),
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            title: Container(),
            icon: Image.asset(
              _currentIndex != 0 ? "images/app.png" : "images/change_app.png",
              height: Px.px(70),
            ),
          ),
          BottomNavigationBarItem(
            title: Container(),
            icon: Image.asset(
              _currentIndex != 1
                  ? "images/message.png"
                  : "images/change_message.png",
              height: Px.px(70),
            ),
          ),
        ],
      ),
    );
  }
}

class Router extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'all',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => HomeRouter(),
        '/random': (BuildContext context) => RandomApp(),
        '/create_code': (BuildContext context) => CreateCode(),
        '/food_list': (BuildContext context) => FoodList(),
        '/food': (BuildContext context) => Food(),
        '/bullet': (BuildContext context) => Bullet(),
      },
    );
  }
}

final ThemeData mDefaultTheme = new ThemeData(primaryColor: Color(0xFF3A4049));
