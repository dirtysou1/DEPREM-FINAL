import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:homescreen/DarkCard1ContainerBOutlined.dart';
import './Component221.dart';
import 'package:homescreen/values/values.dart';

import 'widgets/spaces.dart';
import 'widgets/spaces.dart';

class Yaknlarm extends StatelessWidget {
  Yaknlarm({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromSize(
            bounds: Rect.fromLTWH(0.0, 0.0, 375.0, 667.0),
            size: Size(375.0, 667.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            pinBottom: true,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/3.0x/acilisbg.jpg'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(width: 1.0, color: const Color(0x00000000)),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(35.0, 35.0, 305.0, 48.0),
            size: Size(375.0, 667.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            fixedHeight: true,
            child: Text(
              'YAKIN EKLE',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 36,
                color: const Color(0xffcf8e0c),
                letterSpacing: 3.6,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: new Container(
              height: 500,
              width: 400,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.13333333333333333),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.only(
                left: 10,
                right: 50,
              ),
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Center(
                child: Column(
                  children: [SpaceH8(),
                    Center(
                        child: Text(
                      "Yak??nlar??n??z?? neden eklemelisiniz?",
                      style: Styles.customNormalTextStyle(fontSize: 20),
                    )),
                      SpaceH12(),
                       Center(
                         child: Text("Deprem an??nda g??vende oldu??unuz veya tehlikede oldu??unuz hakk??nda yak??nlar??n??za bilgi verebilmemiz i??in ileti??im bilgilerine ihtiyac??m??z var. Bu bilgiler herhangi bir ??????nc?? ki??i ile payla????lmayacakt??r.",
                            style: Styles.customNormalTextStyle(fontSize: 17),),
                       ),

                  ],
                ),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(127.0, 511.0, 121.0, 113.0),
            size: Size(375.0, 667.0),
            pinBottom: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Component221(),
          ),
        ],
      ),
    );
  }
}
