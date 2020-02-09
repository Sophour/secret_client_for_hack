import 'package:flutter/material.dart';
import 'package:travel_hack_client/constants.dart';
import 'package:http/http.dart' as http;
import 'package:travel_hack_client/main.dart';
import 'package:travel_hack_client/elements/progress_widget.dart';

class TakePhotoScreen extends StatelessWidget{



  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      backgroundColor:  Colors.grey[300],
      appBar: AppBar(
        title: Text('Управление фотоаппаратом'),

      ),
      body: Center(
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
                child: new FlatButton(onPressed: ()=>onTakePhotoButtonTap(context),
                    child: new Text('Сделать\nфото',
                      style: Theme.of(context).textTheme.body1,
                    textAlign: TextAlign.center,))

            ),
          ],
        ),
      ),
//

bottomNavigationBar: BottomAppBar(
  color: Colors.grey[300],
  elevation: 0.0,
  child: setProgressBar(3, 2),
),

    );

  }


  onTakePhotoButtonTap(BuildContext context){
    //sendPhotoSignalToServer(MainServerUrl);
    Navigator.pushNamed(context, LoadingSplashRoute);
  }

  sendPhotoSignalToServer(var url) async{
    var response = await http.post(url, body: {'signal': 'TAKE_PHOTO'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

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