import 'dart:async';
import 'dart:convert';
import 'package:presensiandroid/constant/constant.dart';
import 'package:presensiandroid/launcher.dart';
import 'package:presensiandroid/view/home.dart';
import 'package:presensiandroid/view/absensi.dart';
import 'package:presensiandroid/view/history.dart';
import 'package:presensiandroid/view/about.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Aplikasi Presensi",
    home: Launcher(),
    theme: ThemeData(primaryColor: Colors.orange[500]),
    routes: <String, WidgetBuilder>{
      SPLASH_SCREEN: (BuildContext context) => Launcher(),
      HOME_SCREEN: (BuildContext context) => hal_utama(),
    },
  ));
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

enum LoginStatus { notSignIn, signIn }

class _LoginState extends State<Login> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String username, password;
  final _key = new GlobalKey<FormState>();
  String msg = "";
  bool _secureText = true;
  bool _apicall = false;

  get preferences => null;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _apicall = true;
      });
      // login();
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldState =
      new GlobalKey<ScaffoldState>();

  void _snackbar(String pesan) {
    var str;
    if (str.isEmpty) return;
    _scaffoldState.currentState.showSnackBar(new SnackBar(
      content:
          Text(str, style: new TextStyle(fontSize: 15.0, color: Colors.white)),
    ));
  }

  // login() async {
  //   final response = await http.post(BaseUrl.login,
  //       body: {"username": username, "password": password});
  //   final data = jsonDecode(response.body);
  //   int value = data['value'];
  //   String pesan = data['message'];
  //   String usernameAPI = data['user'];
  //   String namaAPI = data['nama'];
  //   String id = data['user_id'];
  //   String jabatan = data['jabatan'];
  //   String nik = data['nik'];
  //   String foto = data['foto'];

  //   if (value == 1) {
  //     setState(() {
  //       _loginStatus = LoginStatus.signIn;
  //       savePref(value, usernameAPI, namaAPI, id, jabatan, foto, nik);
  //     });
  //     _snackbar(pesan);
  //   } else {
  //     _snackbar(pesan);
  //     setState(() {
  //       _apicall = false;
  //     });
  //   }
  // }

  savePref(int value, String username, String nama, String id, String jabatan,
      String foto, String nik) async {
    setState(() {
      preferences.SetInt("value", value);
      preferences.SetString("nama", nama);
      preferences.SetString("username", username);
      preferences.SetString("id", id);
      preferences.SetString("jabatan", jabatan);
      preferences.SetString("nik", nik);
      preferences.SetString("foto", foto);
      preferences.commit();
    });
  }

  var value;
  getPref() async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");
      _loginStatus = value == 1 ? LoginStatus.notSignIn : LoginStatus.notSignIn;
    });
  }

  // signOut() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     _apicall = false;
  //     preferences.setInt("value", null);
  //     preferences.commit();
  //     _loginStatus = LoginStatus.notSignIn;
  //   });
  // }

  @override
  void initState() {
    if (this.mounted) {
      super.initState();
      getPref();
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return Scaffold(
          body: Form(
            key: _key,
            child: new Container(
              padding: EdgeInsets.only(top: 50.0),
              decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Colors.orange[900],
                Colors.orange[700],
                Colors.orange[500],
              ])),
              child: new Center(
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 40),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Aplikasi Presensi",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    )
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerRight,
                                      child: new Image.asset(
                                        "gambar/logo-absen.png",
                                        width: 100,
                                        height: 100,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              bottomRight: Radius.circular(50))),
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(225, 95, 27, 3),
                                        blurRadius: 5,
                                        offset: Offset(0, 2))
                                  ]),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextFormField(
                                      validator: (e) {
                                        if (e.isEmpty) {
                                          return "please insert username";
                                        }
                                      },
                                      onSaved: (e) => username = e,
                                      decoration: InputDecoration(
                                          hintText: "Username",
                                          hintStyle:
                                              TextStyle(color: Colors.grey)),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextFormField(
                                      obscureText: _secureText,
                                      validator: (e) {
                                        if (e.isEmpty) {
                                          return "please insert password";
                                        }
                                      },
                                      onSaved: (e) => password = e,
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        suffixIcon: IconButton(
                                          onPressed: showHide,
                                          icon: Icon(_secureText
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                                onTap: () {
                                  check(); //cek validasi API Login
                                },
                                child: Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(horizontal: 50),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.orange[900]),
                                  child: Center(
                                    child: _apicall
                                        ? CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.white),
                                          )
                                        : Text(
                                            "Login",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),
        );
        break;
      case LoginStatus.signIn:
        break;
    }
  }
}

class hal_utama extends StatefulWidget {
  @override
  hal_utama_state createState() => hal_utama_state();
}

class hal_utama_state extends State<hal_utama> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Absensi(),
    History(),
    About(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Presensi (BETA)'),
        backgroundColor: Colors.blue,
        // actions: [Icon(Icons.bus_alert)],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Absensi',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat Absensi',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About',
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
