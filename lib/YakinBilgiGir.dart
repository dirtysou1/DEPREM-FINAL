import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './Component271.dart';

class YakinBilgiGir extends StatelessWidget {
  YakinBilgiGir({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromSize(
            bounds: Rect.fromLTWH(-18.0, -73.0, 393.0, 851.0),
            size: Size(375.0, 667.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            pinBottom: true,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/yakinbg.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.dstIn),
                ),
                border: Border.all(width: 1.0, color: const Color(0x00000000)),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(42.0, 244.0, 291.0, 360.0),
            size: Size(375.0, 667.0),
            pinLeft: true,
            pinRight: true,
            pinBottom: true,
            fixedHeight: true,
            child: Component271(),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(35.0, 35.0, 305.0, 144.0),
            size: Size(375.0, 667.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            fixedHeight: true,
            child: Text(
              'YAKININIZIN BİLGİLERİNİ GİRİNİZ',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 36,
                color: const Color(0xffffaa00),
                letterSpacing: 3.6,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(269.0, 257.0, 56.0, 48.0),
            size: Size(375.0, 667.0),
            pinRight: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.cover,
                ),
                border: Border.all(width: 1.0, color: const Color(0x00000000)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
