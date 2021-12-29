import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Center(
              child: Image.asset(
            'images/logo.png',
            width: 250,
            height: 250,
          )),
          Text(
              "Exercise adalah salahsatu Ekstrakulikuler yang berada di SMK Telematika Indramayu, yang berfokuskan pada dunia komputer, IoT, Desain Grafis, Dan Programming.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            'images/isi.PNG',
          ),
        ],
      ),
    );
  }
}
