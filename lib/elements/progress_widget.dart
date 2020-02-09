import 'package:flutter/material.dart';

Container setProgressBar(int numOfBarPoints, int indexOfHighlightedPoint){
  List<Container> barpoints = new List();
  for(var i=0; i<numOfBarPoints; i++){
    barpoints.add(littleCircle(
        i==indexOfHighlightedPoint-1? true : false));
  }

  return Container(
    height: 60,
   child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     crossAxisAlignment: CrossAxisAlignment.center,
     children: barpoints,
    )
  );
}


Widget littleCircle(bool highlighted){
  if(highlighted)
  return new Container(
    padding: EdgeInsets.all(30.0),
      width: 20.0,
      height: 20.0,
      decoration: new BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.redAccent,
            blurRadius: 10.0,
            spreadRadius: 4.0,
          ),
        ],
      color: Colors.red[300],
      shape: BoxShape.circle,
  )
  );
  else
    return new Container(
        padding: EdgeInsets.all(30.0),
        width: 15.0,
        height: 15.0,
        decoration: new BoxDecoration(
          color: Colors.red[300],
          shape: BoxShape.circle,
        )
    );
}