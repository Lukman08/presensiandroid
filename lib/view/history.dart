import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:presensiandroid/model/presensi_model.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  Dio dio = new Dio();
  PresensiModel presensiModel;
  final String url =
      'https://exercise.smktelematikaindramayu.sch.id/api/v2/83f5872d23747fa1fd5f714d5ca7b6954bbbca115809765a721886c19dc67fcf/absen/data_absen';
  Future getAbsen() async {
    Response response = await dio.get(url);
    setState(() {
      presensiModel = PresensiModel.fromJson(response.data);
    });
  }

  @override
  void initState() {
    getAbsen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('History',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
        ),
        body: presensiModel == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : presensiModel.data.length == 0
                ? Center(child: Text('Data Kosong'))
                : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                    itemCount: presensiModel.data.length,
                    itemBuilder: (c, i) {
                      var data = presensiModel.data[i];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 2,
                          child: ListTile(
                            title: Text(data.nama),
                            subtitle: Text(data.kelas),
                            trailing: Text(data.kehadiran),
                          ),
                        ),
                      );
                    }));
  }
}
