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
      body: new Container(
        child: new Center(
          child: new RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)
              ),
              child: new Text(
                'Сделать фото',
                style: Theme.of(context).textTheme.title,),
              onPressed: ()=>onTakePhotoButtonTap(context),
          ),
        ),

        ),

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