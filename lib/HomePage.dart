


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homescreen/plugins_utils/DeviceInfo.dart';
import 'package:homescreen/plugins_utils/Location.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:volume_watcher/volume_watcher.dart';
import 'package:battery/battery.dart';
class HomePage extends StatefulWidget {



  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {




  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer  advancedPlayer;
  AudioCache audioCache;


  @override
  void initState() {
    super.initState();
    initPlayer();
    initPlatformState();
  }


   void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer,respectSilence: false);

    advancedPlayer.durationHandler = (d) => setState(() {
      _duration = d;
    });

    advancedPlayer.positionHandler = (p) => setState(() {
      _position = p;
    });
  }
  String _platformVersion = 'Unknown';
  double currentVolume = 0;
  double initVolume = 0;
  double maxVolume = 0;



  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      VolumeWatcher.hideVolumeView = true;
      platformVersion = await VolumeWatcher.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    double initVolume;
    double maxVolume;
    try {
      initVolume = await VolumeWatcher.getCurrentVolume;
      maxVolume = await VolumeWatcher.getMaxVolume;
    } on PlatformException {
      platformVersion = 'Failed to get volume.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      this.initVolume = initVolume;
      this.maxVolume = maxVolume;
    });
  }


  final Battery _battery = Battery();
  LocationService loca1 = new LocationService();
  UserLocation Loca = new UserLocation();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return new Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/yol.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end,

          children: [
            new Container(
              decoration: BoxDecoration(

                image: new DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.dstATop),
                  image: new NetworkImage(
                    'https://www.egeseramik.com/seriler/20161171091766122.jpg',
                  ),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'lorem10',
                textAlign: TextAlign.center,
              ),
              margin: EdgeInsets.fromLTRB(20,40,20,20),
              height: 170,
              width: 330,
            ),
            new Container(
              alignment: Alignment.bottomRight,
              child: FlatButton(
                  onPressed: () async {


                    advancedPlayer.stop();
                    //advancedPlayer.dispose();




                  },
                  child: Image(
                    image: new AssetImage('assets/yesil1.png'),
                    fit: BoxFit.cover,

                  )),
              height: (size.height * 50) / 250.0,
              width: (size.width * 50) / 100.0,),Divider(),
            new Container(
              alignment: Alignment.centerRight,

              child: FlatButton(
                hoverColor: Colors.purpleAccent,
                onPressed: () async {


                  VolumeWatcher.setVolume(maxVolume); //sesi maximuma çıkarır

                  //batarya bilgisini alır
                  final int batteryLevel = await _battery.batteryLevel;
                  String batter = batteryLevel.toString();
                  print( "Battery level is: $batter");


                  //telefonun modelini öğrenir
                  DeviceInfo.getAndroidDeviceInfo();




                  //konumu alır
                  // ignore: non_constant_identifier_names
                  final LOC = (await loca1.location.getLocation()).toString();
                  print(LOC);


                  //popup mesajını ekranda gösterir
                  AwesomeDialog(context: context,animType: AnimType.SCALE,
                    dialogBackgroundColor: Colors.grey,
                    dialogType: DialogType.INFO,
                    body: Center(child: Text(
                      'Bilgileriniz alınmıştır. En kısa sürede kurtulacaksınız.',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),),
                    title: 'This is Ignored',
                    desc:   'This is also Ignored',
                    btnOkText: 'Tamam',
                    btnOkOnPress: () {},
                  )..show();

                  //alarmı çalar
                  audioCache.loop("alarm.mp3",stayAwake: true,);




                },
                child: Image(
                  image: new AssetImage('assets/nuke.png'),
                  fit: BoxFit.fill,

                ),
              ),
              height: (size.height * 50) / 250.0,
              width: (size.width * 50) / 100.0,),

          ],
        ),
      ),
    );
  }
}
