import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Text('Selamat datang, Lukman Hakim',
              style: TextStyle(fontSize: 16), textAlign: TextAlign.right),
          SizedBox(
            height: 20,
          ),
          Center(child: Image.asset('images/home.png')),
        ],
      ),
    );
  }
}
