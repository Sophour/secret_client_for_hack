import 'package:flutter/material.dart';
import 'package:travel_hack_client/main.dart';
import 'package:travel_hack_client/screens/scan_barcode.dart';

class PhotoPreview extends StatelessWidget{

  //final locations = Location.fetchAll();

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Превью фото'),

      ),
      body: new Column(
//          mainAxisAlignment: MainAxisAlignment.start,
//          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            new Container(
              constraints: BoxConstraints.expand(
                height: 200.0 ,
              ) ,
              decoration: BoxDecoration( color: Colors.grey ) ,
              child: Image.network(
                'http://europe-re.com/uploads/europe/post_cover_images/66324/cover-66324.jpg',
                fit: BoxFit.cover ,
              ) ,
            ) ,
            new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            new RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)
              ),
              child: new Text(
                'Переснять',
                style: Theme.of(context).textTheme.title,),
              onPressed: ()=>onRetakePhotoButtonTap(context)
          ),
              new RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)
                ),
                child: new Text(
                  'Напечатать',
                  style: Theme.of(context).textTheme.title,),
                onPressed: ()=>_showDialog(context),
              ),
            ]),
        ],),
      );

  }


  onRetakePhotoButtonTap(BuildContext context){
    Navigator.pushNamed(context, TakePhotoRoute);
  }
  onPrintPhotoButtonTap(BuildContext context){
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
          content: new Text("Фото отправлено на печать!"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
                onPrintPhotoButtonTap(context);

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