import 'package:flutter/material.dart';
import 'elements/loading_screen.dart';
import 'style.dart';
import 'screens/start_work.dart';
import 'screens/scan_barcode.dart';
import 'screens/take_photo.dart';
import 'screens/photo_prewiew.dart';
import 'constants.dart';

const StartScreenRoute = '/';
const ScanBarcodeRoute = '/scan_barcode';
const TakePhotoRoute = '/take_photo';
const PreviewPhotoRoute = '/photo_preview';
const SuccessSplashRoute = '/sucess_splashscreen';
const SuccessSplash2Route = '/sucess_splashscreen2';
const LoadingSplashRoute = '/loading_splashscreen';

void main() {

  const MainServerUrl="192.168.43.181:8080/"; //TODO

  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
      onGenerateRoute: _routes(),
      theme: _theme(),
    );
  }


  RouteFactory _routes(){
    return (settings){
      //final Map<String,dynamic> arguments = settings.arguments;
      Widget screen;

      switch(settings.name){
        case StartScreenRoute:
          screen = StartScreen();
          break;
        case ScanBarcodeRoute:
          screen = BarcodeScanner();
          break;
        case TakePhotoRoute:
          screen = TakePhotoScreen();
          break;
        case PreviewPhotoRoute:
          screen = PhotoPreview();
          break;
        case SuccessSplashRoute:
          screen = SuccessSplash();
          break;
        case LoadingSplashRoute:
          screen = LoadingSplash();
          break;
          case SuccessSplash2Route:
          screen = SuccessSplash2();
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  ThemeData _theme(){
    return ThemeData( appBarTheme: AppBarTheme(
      color: Colors.grey[300],
      elevation: 0.0,
      textTheme: TextTheme(title: AppBarTextStyle),
    ),
      textTheme: TextTheme(
          title: TitleTextStyle,
          body1: Body1TextStyle
      ),
    );
  }

}