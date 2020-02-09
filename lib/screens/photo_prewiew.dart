import 'package:flutter/material.dart';
import 'package:travel_hack_client/elements/progress_widget.dart';
import 'package:travel_hack_client/main.dart';
import 'package:travel_hack_client/screens/scan_barcode.dart';
import 'package:travel_hack_client/constants.dart';
import 'package:http/http.dart' as http;

class PhotoPreview extends StatefulWidget {
  @override
  _PhotoPreviewState createState() => _PhotoPreviewState();
}

class _PhotoPreviewState extends State<PhotoPreview> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  Colors.grey[300],
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
                  onPressed: (){
                    _showDialog(context);
                    sendPrintSignalToServer(MainServerUrl);},
                ),
              ]),
        ],),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[300],
        elevation: 0.0,
        child: setProgressBar(3, 3),
      ),
    );
  }


  onRetakePhotoButtonTap(BuildContext context){
    Navigator.pushNamed(context, TakePhotoRoute);
  }
  onPrintPhotoButtonTap(BuildContext context){
    Navigator.pushNamed(context, ScanBarcodeRoute);
  }
  sendPrintSignalToServer(var url) async{
    var response = await http.post(url, body: {'signal': 'PRINT'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

  }

  Widget displayLastPhoto(var url){

    getPreviewFromServer(url +"/last_photo");
    setState(() {
      return Image.network(url + "/last_photo",
      fit: BoxFit.cover ,);
    });

  }

  getPreviewFromServer(var url) async{
    print(http.get(url + "/last_photo" ));
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
}


//class PhotoPreview extends StatelessWidget{
//
//
//  @override
//  Widget build( BuildContext context ) {
//   PhotoPreviewWidget();
//  }



//  _onLocationTap(BuildContext context, int locationID){
//    Navigator.pushNamed(context, LocationDetailRoute, arguments: {"id" : locationID});
//  }
//}