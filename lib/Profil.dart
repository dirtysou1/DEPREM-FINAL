import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './Component31.dart';
import './Component41.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profil extends StatelessWidget {
  Profil({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: Stack(
        children: <Widget>[
          Pinned.fromSize(
            bounds: Rect.fromLTWH(0.0, 0.0, 374.3, 675.6),
            size: Size(375.0, 667.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            pinBottom: true,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/profilbg.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.42), BlendMode.dstIn),
                ),
                border: Border.all(width: 1.0, color: const Color(0x00000000)),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(67.5, 175.0, 240.0, 36.9),
            size: Size(375.0, 667.0),
            pinLeft: true,
            pinRight: true,
            fixedHeight: true,
            child: SvgPicture.string(
              _svg_sotl0n,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(112.0, 8.0, 140.0, 131.0),
            size: Size(375.0, 667.0),
            pinTop: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Component31(),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(74.3, 139.0, 197.0, 36.0),
            size: Size(375.0, 667.0),
            fixedWidth: true,
            fixedHeight: true,
            child: Text(
              'Sayın:',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(42.0, 226.4, 291.0, 348.6),
            size: Size(375.0, 667.0),
            pinLeft: true,
            pinRight: true,
            pinBottom: true,
            fixedHeight: true,
            child: SvgPicture.string(
              _svg_ki75v0,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(60.0, 249.0, 122.0, 294.0),
            size: Size(375.0, 667.0),
            fixedWidth: true,
            fixedHeight: true,
            child: Text(
              '\nDoğum Yılınız  :\n\n\n\nKan grubunuz     :\n\n\n\nCinsiyetiniz        :\n\n\n\n',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(194.0, 261.1, 127.0, 37.0),
            size: Size(375.0, 667.0),
            pinRight: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Component41(),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(187.5, 433.5, 127.0, 37.0),
            size: Size(375.0, 667.0),
            fixedWidth: true,
            fixedHeight: true,
            child: SvgPicture.string(
              _svg_afdkjl,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(187.5, 347.3, 127.0, 37.0),
            size: Size(375.0, 667.0),
            fixedWidth: true,
            fixedHeight: true,
            child: SvgPicture.string(
              _svg_2wtv3q,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(153.0, 554.0, 69.0, 21.0),
            size: Size(375.0, 667.0),
            pinBottom: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Text(
              'DÜZENLE',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(162.0, 507.0, 52.0, 47.0),
            size: Size(375.0, 667.0),
            fixedWidth: true,
            fixedHeight: true,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11.0),
                image: DecorationImage(
                  image: const AssetImage('assets/images/editbutton.png'),
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

const String _svg_sotl0n =
    '<svg viewBox="67.5 175.0 240.0 36.9" ><path transform="translate(67.5, 174.97)" d="M 20.38414573669434 0 L 219.6103668212891 0 C 230.8682098388672 0 239.9944915771484 8.25543212890625 239.9944915771484 18.43902587890625 C 239.9944915771484 28.62261962890625 230.8682098388672 36.8780517578125 219.6103668212891 36.8780517578125 L 20.38414573669434 36.8780517578125 C 9.126294136047363 36.8780517578125 0 28.62261962890625 0 18.43902587890625 C 0 8.25543212890625 9.126294136047363 0 20.38414573669434 0 Z" fill="#ffffff" fill-opacity="0.13" stroke="#707070" stroke-width="1" stroke-opacity="0.31" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ki75v0 =
    '<svg viewBox="42.0 226.4 291.0 348.6" ><path transform="translate(42.0, 226.36)" d="M 37.66990280151367 0 L 253.3300933837891 0 C 274.1346130371094 0 291 17.68754577636719 291 39.50624084472656 L 291 309.1363220214844 C 291 330.9550170898438 274.1346130371094 348.642578125 253.3300933837891 348.642578125 L 37.66990280151367 348.642578125 C 16.86538887023926 348.642578125 0 330.9550170898438 0 309.1363220214844 L 0 39.50624084472656 C 0 17.68754577636719 16.86538887023926 0 37.66990280151367 0 Z" fill="#ffffff" fill-opacity="0.13" stroke="#707070" stroke-width="1" stroke-opacity="0.31" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_afdkjl =
    '<svg viewBox="187.5 433.5 127.0 37.0" ><path transform="translate(187.5, 433.51)" d="M 0 0 L 127 0 L 127 37 L 82.58338928222656 37 L 0 37 L 0 0 Z" fill="#ffffff" fill-opacity="0.04" stroke="#707070" stroke-width="1" stroke-opacity="0.04" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_2wtv3q =
    '<svg viewBox="187.5 347.3 127.0 37.0" ><path transform="translate(187.5, 347.29)" d="M 0 0 L 127 0 L 127 37 L 82.58338928222656 37 L 0 37 L 0 0 Z" fill="#ffffff" fill-opacity="0.04" stroke="#707070" stroke-width="1" stroke-opacity="0.04" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
