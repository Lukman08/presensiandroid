import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userid, username, namalengkap, jabatan, nik, foto, urlfoto;

  getPref() {
    setState(() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      userid = preferences.getString("id");
      username = preferences.getString("username");
      namalengkap = preferences.getString("namalengkap");
      jabatan = preferences.getString("jabatan");
      nik = preferences.getString("nik");
      foto = preferences.getString("foto");
      urlfoto = foto;
    });
  }

  void setState(fn) {
    super.setState(fn);
    getPref();
  }

  static final List<String> imgSlider = [
    '1.png',
    '2.png',
    '3.png',
    '4.png',
  ];
  final CarouselSlider autoPlayImages = CarouselSlider(
    options: CarouselOptions(
      autoPlay: true,
      aspectRatio: 2.0,
      enlargeCenterPage: true,
    ),
    items: imgSlider.map((FileImage) {
      return Container(
        margin: EdgeInsets.all(5.0),
        child: Image.asset(
          "images/slider/(fileImage)",
          width: 10000,
          fit: BoxFit.cover,
        ),
      );
    }).toList(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          autoPlayImages,
          Divider(
            color: Colors.white,
          ),
          Akun(
            userid: userid,
            username: username,
            namalengkap: namalengkap,
            jabatan: jabatan,
            nik: nik,
            url: urlfoto,
          ),
          Divider(
            color: Colors.white,
          ),
          MenuUtama(),
        ],
      ),
    );
  }
}

class Akun extends StatelessWidget {
  String userid, username, namalengkap, jabatan, kodekantor, nik, url;

  Akun(
      {this.userid,
      this.username,
      this.namalengkap,
      this.jabatan,
      this.kodekantor,
      this.nik,
      this.url});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: new GestureDetector(
      onTap: () => Navigator.of(context)
          .push(new MaterialPageRoute(builder: (BuildContext context) => null)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: Container(
              width: 50.0,
              height: 100.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: new NetworkImage(url ??
                          "https://kreditmandiri.co.id/api_test/absensi/profile/photo.jpg")))),
          title: Text(
            nik ?? '12345678',
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                namalengkap ?? 'Lukman Hakim',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              new Text(
                jabatan ?? 'Manager IT',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class MenuUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 4,
          children: <Widget>[
            Column(
              children: [
                Material(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Colors.amber[700],
                  child: IconButton(
                    icon: Icon(Icons.access_alarm),
                    onPressed: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => null));
                    },
                    padding: EdgeInsets.all(10),
                    color: Colors.pink,
                    iconSize: 25.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Presensi',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              children: [
                Material(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Colors.amber[700],
                  child: IconButton(
                    icon: Icon(Icons.edit_attributes),
                    onPressed: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => null));
                    },
                    padding: EdgeInsets.all(10),
                    color: Colors.pink,
                    iconSize: 25.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Premit',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              children: [
                Material(
                    borderRadius: BorderRadius.circular(100.0),
                    color: Colors.amber[700],
                    child: IconButton(icon: Icon(Icons.place)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
