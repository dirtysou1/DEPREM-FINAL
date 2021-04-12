import 'dart:async';

/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has four [BottomNavigationBarItem]
// widgets, which means it defaults to [BottomNavigationBarType.shifting], and
// the [currentIndex] is set to index 0. The selected item is amber in color.
// With each [BottomNavigationBarItem] widget, backgroundColor property is
// also defined, which changes the background color of [BottomNavigationBar],
// when that item is selected. The `_onItemTapped` function changes the
// selected item's index and displays a corresponding message in the center of
// the [Scaffold].

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';


import 'package:homescreen/ProfilSayfasi.dart';
import 'package:homescreen/ProfilePage.dart';
import 'package:homescreen/InfoPage.dart';

import 'package:homescreen/Butonlar.dart';

import 'package:homescreen/Yaknlarm.dart';
import 'package:get/get.dart';
import 'package:homescreen/SonDepremler.dart';

import 'package:homescreen/views/LoginScreen.dart';
import 'package:homescreen/views/SignUpScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ProfilePage.dart';
import 'SettingsPage.dart';

import 'settings_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(MaterialApp(home: MyApp()));

}
String finalEmail;
String finalID;
String finalisim,finaldogumyili,finalil,finalsoyisim,finaltel;

/// This is the main application widget.
class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  void initState(){
    getValidationData().whenComplete(() async {
      Timer(Duration(seconds:0),()=> Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => (finalEmail==null ? LoginScreen() : MyStatefulWidget()))));

    });
    super.initState();

  }

  static const String _title = 'Flutter Code Sample';
  Future getValidationData() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainEmail = sharedPreferences.getString('email');
    var obtainID = sharedPreferences.getString('id');
    var obtainisim = sharedPreferences.getString('isim');
    var obtainsoyisim = sharedPreferences.getString('soyisim');
    var obtainnumara = sharedPreferences.getString('tel');
    var obtainil = sharedPreferences.getString('il');
    var obtaindogumyili = sharedPreferences.getString('dogumyili');

    setState((){
      finalEmail = obtainEmail;
      finalID = obtainID;
      finalisim =obtainisim;
      finalsoyisim = obtainsoyisim;
      finaldogumyili= obtaindogumyili;
      finalil =obtainil;
      finaltel = obtainnumara;
      /*finalyakinnumara1= obtainYakinnumara1;
    finalyakinisim1 = obtainYakinisim1;
    finalyakinoyisim1 =obtainYakinsoyisim1;*/

    });
    print(finalEmail);
    print(finalID);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        home: LoginScreen()
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.red);

  final List<Widget> _widgetOptions = <Widget>[
    Butonlar(),
    ProfilSayfasi(),
    Yaknlarm(),
    Depremapi(),
  ];

  void _onItemTapped(int index) {
    setState(() {

      _selectedIndex = index;

    });
  }
  //(child: _widgetOptions.elementAt(_selectedIndex))
  @override
  Widget build(BuildContext context) {
    return Scaffold( body: Center(
      child:_widgetOptions.elementAt(_selectedIndex),
    ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Anasayfa',
            backgroundColor: Color.fromRGBO(54,54,54,1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'Profil',
            backgroundColor: Color.fromRGBO(54,54,54,1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.family_restroom_outlined),
            label: 'Yakınlarım',
            backgroundColor: Color.fromRGBO(54,54,54,1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apartment_outlined),
            activeIcon: Icon(Icons.apartment_sharp),
            label: 'Son Depremler',
            backgroundColor: Color.fromRGBO(54,54,54,1),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
