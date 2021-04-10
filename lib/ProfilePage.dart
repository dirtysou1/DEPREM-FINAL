import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homescreen/main.dart';
import 'package:homescreen/values/values.dart';
import 'package:homescreen/widgets/potbelly_button.dart';
import 'package:homescreen/widgets/spaces.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  StreamController<List> _streamController = StreamController<List>();
  Timer _timer;
  final TextEditingController _emailTextController =
  new TextEditingController();
  final TextEditingController _passwordTextController =
  new TextEditingController();


  Future getData() async {
    var url = "https://www.easyrescuer.com/kisi_getir.php";
    http.Response response = await http.get((Uri.parse(url)));
    List data = json.decode(response.body);

    //Add your data to stream
    _streamController.add(data);
  }




  @override
  void initState() {
    getData();

    //Check the server every 5 seconds
    _timer = Timer.periodic(Duration(seconds: 5), (timer) => getData());

    super.initState();
  }

  @override
  void dispose() {
    //cancel the timer
    if (_timer.isActive) _timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
        centerTitle: true,
      ),
      body: StreamBuilder<List>(
        stream: _streamController.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData)
            return ListView(
              children: [
                for (Map document in snapshot.data)
                  ListTile(
                    title: Text('${document['title']}'),
                    subtitle: Text('${document['type']}'),
                  ),
              ],
            );
          return Text('Loading...');
        },
      ),
    );
  }
}
