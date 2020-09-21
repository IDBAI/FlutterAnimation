import 'package:animation_demo/animation/AnimationDemo01.dart';
import 'package:animation_demo/animation/AnimationDemo02.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(HomeApp());

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('en', 'US'),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/animation': (context) => AnimationDemo02(),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter demo'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            OutlineButton(
              onPressed: () => {Navigator.pushNamed(context, '/animation')},
              child: Text('点击跳转Animation页面'),
            )
          ],
        ),
      ),
    );
  }
}
