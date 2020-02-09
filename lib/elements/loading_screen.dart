import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:travel_hack_client/screens/photo_prewiew.dart';
import 'package:travel_hack_client/screens/scan_barcode.dart';
import 'package:travel_hack_client/screens/take_photo.dart';

class SuccessSplash extends StatefulWidget {

//  String text;
//  StatefulWidget nextPage;
//
//  LoadingSplash(this.text, this.nextPage);

  @override
  _SuccessSplashState createState() => new _SuccessSplashState();
}

class _SuccessSplashState extends State<SuccessSplash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 1,
        navigateAfterSeconds: TakePhotoScreen(),
        title: new Text("Штрих-коды успешно\nсчитаны",
          style: Theme.of(context).textTheme.body1,
          textAlign: TextAlign.center,
        ),

        image: new Image.asset('assets/images/successIcon.png',
        scale: 0.7,

        ),
        backgroundColor: Colors.grey[300],
//        styleTextUnderTheLoader: new TextStyle(),
//        photoSize: 100.0,
//        onClick: ()=>print("Flutter Egypt"),
//        loaderColor: Colors.red
    );
  }
}

class LoadingSplash extends StatefulWidget {
  @override
  _LoadingSplashState createState() => _LoadingSplashState();
}

class _LoadingSplashState extends State<LoadingSplash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 2,
      navigateAfterSeconds: PhotoPreview(),
      title: new Text("Отправление фото\nна печать",
        style: Theme.of(context).textTheme.body1,
        textAlign: TextAlign.center,
      ),

      image: new Image.asset('assets/images/successIcon.png',
        scale: 0.7,

      ),
      backgroundColor: Colors.grey[300],
//        styleTextUnderTheLoader: new TextStyle(),
//        photoSize: 100.0,
//        onClick: ()=>print("Flutter Egypt"),
//        loaderColor: Colors.red
    );
  }
}

class SuccessSplash2 extends StatefulWidget {

//  String text;
//  StatefulWidget nextPage;
//
//  LoadingSplash(this.text, this.nextPage);

  @override
  _SuccessSplashState2 createState() => new _SuccessSplashState2();
}

class _SuccessSplashState2 extends State<SuccessSplash2> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 1,
      navigateAfterSeconds: BarcodeScanner(),
      title: new Text("Фото отправлено\nна печать",
        style: Theme.of(context).textTheme.body1,
        textAlign: TextAlign.center,
      ),

      image: new Image.asset('assets/images/successIcon.png',
        scale: 0.7,

      ),
      backgroundColor: Colors.grey[300],
//        styleTextUnderTheLoader: new TextStyle(),
//        photoSize: 100.0,
//        onClick: ()=>print("Flutter Egypt"),
//        loaderColor: Colors.red
    );
  }
}