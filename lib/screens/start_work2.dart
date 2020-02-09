import 'package:flutter/material.dart';
import 'package:travel_hack_client/main.dart';
import 'package:travel_hack_client/screens/scan_barcode.dart';

class StartScreen2 extends StatelessWidget{

  bool darkMode = false;
  //final locations = Location.fetchAll();

  @override
  Widget build( BuildContext context ) {
    return StartScreenWidget2();
  }

}

class StartScreenWidget2 extends StatefulWidget {
  @override
  _StartScreenWidget2State createState() => _StartScreenWidget2State();
}

class _StartScreenWidget2State extends State<StartScreenWidget2> {

  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? Colors.grey[850] : Colors.grey[300],
      appBar: AppBar(
        title: Text('Начало работы'),

      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              child: Icon(Icons.android, size: 80, color: darkMode ? Colors.white : Colors.black),
              decoration: BoxDecoration(
                  color: darkMode ? Colors.grey[850] : Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                        color: darkMode ? Colors.black54 : Colors.grey[500],
                        offset: Offset(4.0, 4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0),
                    BoxShadow(
                        color: darkMode ? Colors.grey[800] : Colors.white,
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0),
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.only(top: 50, right: 3),
                  child: FlatButton(
                    color: Colors.white,
                    child: Text('Light', style: TextStyle(color: Colors.black),),
                    onPressed: () {
                      setState(() {
                        darkMode = false;
                      });                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 3),
                  child: FlatButton(
                    color: Colors.black,
                    child: Text('Dark', style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      setState(() {
                        darkMode = true;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

//      new Container(
//        child: new Center(
//          child: new RaisedButton(
//              shape: RoundedRectangleBorder(
//                  borderRadius: new BorderRadius.circular(18.0),
//                  side: BorderSide(color: Colors.red)
//              ),
//              child: new Text(
//                'Нажмите, чтобы начать работу',
//                style: Theme.of(context).textTheme.title,),
//              onPressed: ()=>onStartButtonTap(context)
//          ),
//        ),
//      ),
    );
  }
  onStartButtonTap(BuildContext context){
    Navigator.pushNamed(context, ScanBarcodeRoute);
  }


  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}


