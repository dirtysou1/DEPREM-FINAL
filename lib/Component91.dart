import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:homescreen/Butonlar.dart';
import 'package:homescreen/main.dart';
import 'package:homescreen/plugins_utils/Location.dart';

class Component91 extends StatelessWidget {
  Component91({
    Key key,
  }) : super(key: key);
  LocationService loca1 = new LocationService();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[        Pinned.fromSize(
        bounds: Rect.fromLTWH(23.0, 29.0, 206.0, 53.0),
        size: Size(252.0, 86.0),
        pinLeft: true,
        pinRight: true,
        pinBottom: true,
        fixedHeight: true,
        child: Text(
          'İZİN VER',
          style: TextStyle(
            fontFamily: 'Rockwell Nova',
            fontSize: 20,
            color: const Color(0xf7ffffff),
            letterSpacing: 2,
          ),
          textAlign: TextAlign.center,
        ),
      ),
        Pinned.fromSize(
          bounds: Rect.fromLTWH(0.0, 0.0, 252.0, 86.0),
          size: Size(252.0, 86.0),
          pinLeft: true,
          pinRight: true,
          pinTop: true,
          pinBottom: true,
          child: Container(child:FlatButton(
            onPressed: (){
//konum için gerekli izinleri ister
              loca1.location.requestPermission();
              loca1.location.serviceEnabled();
              loca1.location.requestService();
              loca1.location.hasPermission();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>MyStatefulWidget() ));
            },
              child:Text('')
          ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23.0),
              color: const Color(0x6affffff),
              border: Border.all(width: 1.0, color: const Color(0x6a707070)),
            ),
          ),
        ),

      ],
    );
  }
}
