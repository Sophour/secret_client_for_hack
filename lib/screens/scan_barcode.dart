import 'dart:async';
import 'dart:collection';
import 'package:travel_hack_client/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:travel_hack_client/main.dart';
import 'package:travel_hack_client/elements/progress_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

//void main() => runApp(MyApp());

class BarcodeScanner extends StatefulWidget {
  @override
  _BarcodeScannerState createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScanner> {
  String _scanBarcode = 'Unknown';
  LinkedHashSet<String> allBarcodes;

  @override
  void initState() {
    super.initState();
  }

  startBarcodeScanStream(LinkedHashSet<String> allBarcodes) async {
    allBarcodes = new LinkedHashSet();
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
        "#ff6666", 'Далее', false, ScanMode.BARCODE) //'Штрихкодов считано: ${allBarcodes.length}'
        .listen((barcode){
          setState(() {
            allBarcodes.add(barcode);

          Fluttertoast.showToast(
              msg: "Штрихкодов считано: ${allBarcodes.length}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 1,
              //backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
             print(barcode);});
            Navigator.pushNamed(context, SuccessSplashRoute);
          //_showDialog(context, "Коды успешно считаны");
          });

  }

  startBarcodeScanCycle(){


  }


  // Platform messages are asynchronous, so we initialize in an async method.
//  Future<void> scanBarcodeNormal() async {
//    String barcodeScanRes;
//    // Platform messages may fail, so we use a try/catch PlatformException.
//    try {
//      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//          "#ff6666", "Дальше", true, ScanMode.BARCODE);
//      print(barcodeScanRes);
//      setState(() {
//        allBarcodes.add(barcodeScanRes);
//      });
//
//      Fluttertoast.showToast(
//          msg: "Штрихкодов считано: ${allBarcodes.length}",
//          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.BOTTOM,
//          timeInSecForIos: 1,
//          //backgroundColor: Colors.red,
//          textColor: Colors.white,
//          fontSize: 16.0
//      );
//
//      Navigator.pushNamed(context, SuccessSplashRoute);
//    } on PlatformException {
//      barcodeScanRes = 'Failed to get platform version.';
//    }
//
//    // If the widget was removed from the tree while the asynchronous platform
//    // message was in flight, we want to discard the reply rather than calling
//    // setState to update our non-existent appearance.
//    if (!mounted) return;
//
//    setState(() {
//      _scanBarcode = barcodeScanRes;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _theme(),
        home: Scaffold(
          backgroundColor: Colors.grey[300],
            appBar: AppBar(title: const Text('Скан штрих-кода')),
            body: Builder(builder: (BuildContext context) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: 200,
                        height: 200,
                        //child: Icon(Icons.android, size: 80, color:  Colors.black),
                        decoration: BoxDecoration(
                            color: Colors.grey[300],//red[400],
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[500],
                                  offset: Offset(4.0, 4.0),
                                  blurRadius: 15.0,
                                  spreadRadius: 1.0),
                              BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-4.0, -4.0),
                                  blurRadius: 15.0,
                                  spreadRadius: 1.0),
                            ]),
                        child: new FlatButton(onPressed: ()=>startBarcodeScanStream(allBarcodes),
                            child: new Text('Считать\nштрих-коды',
                              style: Theme.of(context).textTheme.body1,
                              textAlign: TextAlign.center,))

                    ),
                  ],
                ),
              );
                //Container(
//                  alignment: Alignment.center,
//                  child: Flex(
//                      direction: Axis.vertical,
//                      mainAxisAlignment: MainAxisAlignment.spaceAround,
//                      children: <Widget>[
////                        RaisedButton(
////                            onPressed: () => scanBarcodeNormal(),
////                            child: Text("Start barcode scan")),
////                        RaisedButton(
////                            onPressed: () => scanQR(),
////                            child: Text("Start QR scan")),
//                        RaisedButton(
//                            onPressed: () => startBarcodeScanStream(allBarcodes),
//                            child: Text("Сканировать штрих-коды")),
////                        Text('Scan result : $_scanBarcode\n',
////                            style: TextStyle(fontSize: 20)),
//                      ])
//              );

            }

            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.grey[300],
            elevation: 0.0,
            child: setProgressBar(3, 1),
    ),
        )
    );
  }
  void _showDialog(BuildContext context, String msg) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text(msg),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
                onSuccessfulBarcodeScan(context);
              },
            ),
          ],
        );
      },
    );
  }

  onSuccessfulBarcodeScan(BuildContext context){
    Navigator.pushNamed(context, TakePhotoRoute);
  }

  ThemeData _theme() {
    return ThemeData( appBarTheme: AppBarTheme(
      color: Colors.grey[300] ,
      elevation: 0.0 ,
      textTheme: TextTheme( title: AppBarTextStyle ) ,
    ) ,
      textTheme: TextTheme(
          title: TitleTextStyle ,
          body1: Body1TextStyle
      ) ,
    );
  }

}
//
//  Future<void> scanQR() async {
//    String barcodeScanRes;
//    // Platform messages may fail, so we use a try/catch PlatformException.
//    try {
//      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//          "#ff6666", "Cancel", true, ScanMode.QR);
//      print(barcodeScanRes);
//    } on PlatformException {
//      barcodeScanRes = 'Failed to get platform version.';
//    }
//
//    // If the widget was removed from the tree while the asynchronous platform
//    // message was in flight, we want to discard the reply rather than calling
//    // setState to update our non-existent appearance.
//    if (!mounted) return;
//
//    setState(() {
//      _scanBarcode = barcodeScanRes;
//    });
//  }