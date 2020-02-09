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
              height: 550.0 ,
            ) ,
            decoration: BoxDecoration( color: Colors.grey ) ,
            child: Image.asset('assets/images/valya.jpg',//.network('http://europe-re.com/uploads/europe/post_cover_images/66324/cover-66324.jpg',
              fit: BoxFit.contain ,
            ) ,
          ) ,
          new Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                Center(
                  heightFactor: 1.4,
                  child: Column(
                    
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: 150,
                          height: 100,
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
                          child: new FlatButton(onPressed: ()=>onRetakePhotoButtonTap(context),
                              child: new Text('Переснять',
                                style: Theme.of(context).textTheme.body1,))

                      ),
                    ],
                  ),
                ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: 150,
                          height: 100,
                          //child: Icon(Icons.android, size: 80, color:  Colors.black),
                          decoration: BoxDecoration(
                              color: Colors.grey[850],//red[400],
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[850],
                                    offset: Offset(4.0, 4.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0),
                                BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-4.0, -4.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0),
                              ]),
                          child: new FlatButton(onPressed: (){onPrintPhotoButtonTap(context);
                                              //sendPrintSignalToServer(MainServerUrl);
    },
                              child: new Text('Напечатать',

                                style: new TextStyle(
                                  fontFamily: 'Century Gothic',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ))

                      ),
                    ],
                  ),

//                new RaisedButton(
//                    shape: RoundedRectangleBorder(
//                        borderRadius: new BorderRadius.circular(18.0),
//                        side: BorderSide(color: Colors.red)
//                    ),
//                    child: new Text(
//                      'Переснять',
//                      style: Theme.of(context).textTheme.title,),
//                    onPressed: ()=>onRetakePhotoButtonTap(context)
//                ),
//                new RaisedButton(
//                  shape: RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(18.0),
//                      side: BorderSide(color: Colors.red)
//                  ),
//                  child: new Text(
//                    'Напечатать',
//                    style: Theme.of(context).textTheme.title,),
//                  onPressed: (){
//                    _showDialog(context);
//                    sendPrintSignalToServer(MainServerUrl);},
//                ),
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

    Navigator.pushNamed(context, SuccessSplash2Route);
  }
  sendPrintSignalToServer(var url) async{
    var response = await http.post(url, body: {'signal': 'PRINT'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

  }

//  Widget displayLastPhoto(var url){
//
//    getPreviewFromServer(url +"/last_photo");
//    setState(() {
//      return Image.network(url + "/last_photo",
//      fit: BoxFit.cover ,);
//    });
//
//  }

 getPreviewFromServer(var url) async{
   //var uriResponse =  http.Request('GET', new Uri(path: 'http://192.168.43.181:8080/2.jpg'))
   //    .headers['keep-alive'];
//   var client = http.createHttpClient();
//   client.get(new Uri.http("locahost:8000", "/category"));
//int i = 0;
   //print(await http.read('http://192.168.43.181:8080/2.jpg'));
    //Uri
   // var result =  http.get('' );
//    var client = http.Client();
//    try {
//      var uriResponse = http.get('http://192.168.43.181:8080/2.jpg'); //await client.post('https://example.com/whatsit/create',
////          //body: {hui: sosi});
//      print(await client.get(uriResponse.toString()));
//    } finally {
//     client.close();
//    }

     var res = await http.get('http://192.168.43.181:8080/2.jpg');
     if (res.statusCode != 200) throw Exception('get error: statusCode= ${res.statusCode}');
     print(res.body);

    /*
    var url = 'https://example.com/whatsit/create';
var response = await http.get(url);
print('Response status: ${response.statusCode}');
print('Response body: ${response.body}');

print(await http.read('https://example.com/foobar.txt'));
   */
    //print(result.body.toString());
   // return result;//new Image.file(result.body.,
      //fit: BoxFit.cover,
    //);
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