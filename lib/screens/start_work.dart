import 'package:flutter/material.dart';
import 'package:travel_hack_client/main.dart';
import 'package:travel_hack_client/screens/scan_barcode.dart';

class StartScreen extends StatelessWidget{

  //final locations = Location.fetchAll();

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Начало работы'),

      ),
      body: new Container(
        child: new Center(
          child: new RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)
              ),
              child: new Text(
                'Нажмите, чтобы начать работу',
                style: Theme.of(context).textTheme.title,),
              onPressed: ()=>onStartButtonTap(context)
          ),
        ),
      ),
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

//  _onLocationTap(BuildContext context, int locationID){
//    Navigator.pushNamed(context, LocationDetailRoute, arguments: {"id" : locationID});
//  }
}