import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<Home> with TickerProviderStateMixin<Home> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: Container(
        child: Text('aaaa'),
      ),
    );
  }
}
