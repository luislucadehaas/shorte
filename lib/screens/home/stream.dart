import 'package:flutter/material.dart';
import 'package:shortefilmfestival/screens/home/detail.dart';
import 'package:shortefilmfestival/screens/home/video.dart';

class Stream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
final makeCard =
  new GestureDetector(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailPage()),
      );
      },
    child: new Container(
        padding: EdgeInsets.only(left:16.0, top: 8.0, right: 16.0, bottom: 16.0),

          child: Material(
          elevation: 5.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            child: Stack(

            children: <Widget>[
              ClipRRect(

                  borderRadius: BorderRadius.circular(5.0),


                  child: Image.network("https://firebasestorage.googleapis.com/v0/b/shorte-festival.appspot.com/o/aime10.png?alt=media&token=8bb735f5-a5e9-4acb-a1ed-7297bb94757d", fit: BoxFit.cover,)),
              Positioned(
                right: 5.0,
                top: 5.0,
                child: IconButton(
                  onPressed: (){

                  },
                  icon: Icon(Icons.favorite_border, color: Colors.white),
                ),
              ),
              Positioned(
                left: 10.0,
                top: 10.0,
                  child: Container(
                  padding: EdgeInsets.symmetric(horizontal:8.0,vertical: 5.0),
                  color: Colors.yellow.withOpacity(0.4),
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Horror", style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold
                      )),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 5.0,
                bottom: 3.0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal:5.0,vertical: 8.0),
                  color: Colors.black.withOpacity(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("14:12", style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                      )),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 3.0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal:10.0,vertical: 8.0),
                  color: Colors.black.withOpacity(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("The short film of the week", style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold
                      )),
                      Text("Hans Maier · USA · 2016", style: TextStyle(
                          color: Colors.white,
                        fontSize: 18.0,
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        ),
      );


    final makeBody = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return makeCard;
        },
      ),

    );
    return makeBody;
  }
}