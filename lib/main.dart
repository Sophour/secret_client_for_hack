import 'package:flutter/material.dart';
import 'style.dart';
import 'screens/start_work.dart';
import 'screens/scan_barcode.dart';

const StartScreenRoute = '/';
const ScanBarcodeRoute = '/scan_barcode';
const TakePhotoRoute = '/take_photo';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartScreen(),
      onGenerateRoute: _routes(),
      theme: _theme(),
    );
  }


  RouteFactory _routes(){
    return (settings){
      final Map<String,dynamic> arguments = settings.arguments;
      Widget screen;

      switch(settings.name){
        case StartScreenRoute:
          screen = StartScreen();
          break;
        case ScanBarcodeRoute:
          screen = BarcodeScanner();
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  ThemeData _theme(){
    return ThemeData( appBarTheme: AppBarTheme(
      textTheme: TextTheme(title: AppBarTextStyle),
    ),
      textTheme: TextTheme(
          title: TitleTextStyle,
          body1: Body1TextStyle
      ),
    );
  }
}