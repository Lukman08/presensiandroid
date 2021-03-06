import 'package:presensiandroid/constant/constant.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class Launcher extends StatefulWidget {
  @override
  _LauncherState createState() => _LauncherState();
}

class _LauncherState extends State<Launcher>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  startTimer() async {
    var _duration = new Duration(seconds: 10);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(HOME_SCREEN);
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.all(8.0),
              ),
              new Image.asset(
                'images/logo.png',
                width: animation.value * 200,
                height: animation.value * 200,
              ),
              new Padding(
                padding: EdgeInsets.all(8.0),
              ),
            ],
          )),
    );
  }
}
