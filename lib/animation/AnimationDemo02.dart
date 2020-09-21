import 'package:flutter/material.dart';

class AnimationDemo02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Page'),
        elevation: 0.2,
      ),
      body: AnimationHome(),
    );
  }
}

class AnimationHome extends StatefulWidget {
  @override
  _AnimationHomeState createState() => _AnimationHomeState();
}

class _AnimationHomeState extends State<AnimationHome>
    with TickerProviderStateMixin {
  AnimationController _controller;
  CurvedAnimation _curved;
  Animation animation;
  Animation animationColor;
  Animation positionAnimation;
  Animation changeAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 1500), vsync: this)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((state) {
            if (state == AnimationStatus.forward) {
            } else if (state == AnimationStatus.completed) {
              _controller.reverse();
            }
          });
    _curved = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
    animation = Tween(begin: 20.0, end: 100.0).animate(_curved);
    animationColor =
        ColorTween(begin: Colors.red, end: Colors.blue).animate(_curved);
    positionAnimation = Tween(begin: -50.0, end: 200.0).animate(_curved);
    changeAnimation = StepTween(begin: 0, end: 1).animate(_curved);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: positionAnimation.value,
          left: 150,
          width: 50,
          height: 50,
          child: Container(
            child: Image(
              image: AssetImage('images/bord_icon.png'),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
