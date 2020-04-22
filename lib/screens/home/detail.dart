import 'package:flutter/material.dart';
import 'package:shortefilmfestival/screens/home/download.dart';
import 'package:shortefilmfestival/screens/home/home.dart';
import 'package:shortefilmfestival/screens/home/video.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  //final Lesson lesson;
 // DetailPage({Key key, this.lesson}) : super(key: key);
  @override
  Widget build(BuildContext context) {
//    final levelIndicator = Container(
//      child: Container(
//        //child: LinearProgressIndicator(
//           // backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
//           // value: lesson.indicatorValue,
//           // valueColor: AlwaysStoppedAnimation(Colors.green)),
//      ),
//    );


    Container _buildDiv() {
      return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        width: double.infinity,
        height: 1.0,
        color: Colors.grey.shade300,
      );
    }
    BoxDecoration myBoxDecoration() {
      return BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
      );
    }

    //this is just a placeholder for a possible design
    final fav = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.star, color: Colors.white.withOpacity(0.35)),
          Icon(Icons.star, color: Colors.white.withOpacity(0.35)),
          Icon(Icons.star, color: Colors.white.withOpacity(0.35)),
          Icon(Icons.star, color: Colors.white.withOpacity(0.35)),
          Icon(Icons.star, color: Colors.white.withOpacity(0.35)),
        ],
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 100.0),
        fav,
        SizedBox(height: 15.0),
        Text("The film of the week",
         style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5.0),
        Text("Hans Zimmer · USA · 2016",
          style: TextStyle(color: Colors.white, fontSize: 17.0),
        ),
        SizedBox(height: 10.0),
        IconButton(
          iconSize: 70.0,
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChewieDemo()),
            );
          },
          icon: Icon(Icons.play_arrow, color: Colors.white),
        ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Container(
               margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(5.0),
                decoration: myBoxDecoration(), //       <--- BoxDecoration here
                   child: Text(
                     "14:15 Minutes",
                   style: TextStyle(fontSize: 12.0, color: Colors.white),
                  ),
              ),
            //Expanded(flex: 1, child: coursePrice)
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new NetworkImage("https://firebasestorage.googleapis.com/v0/b/shorte-festival.appspot.com/o/aime10.png?alt=media&token=8bb735f5-a5e9-4acb-a1ed-7297bb94757d"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, .5)),
          child: Center(
            child: topContentText,
          ),
        ),

        Positioned(
          left: 19.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
        Positioned(
          right: 19.0,
          top: 60.0,
          child: InkWell(
            onTap: () {

            },
            child: Icon(Icons.share, color: Colors.white),
          ),
        )
      ],
    );


    final iconrow = Container(
      height: 55.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
                IconButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                    );
                      },
                   icon: Icon(Icons.arrow_downward, color: Colors.black),
           ),
                IconButton(
          onPressed: (){
          },
                  icon: Icon(Icons.radio, color: Colors.black),
        ),
             IconButton(
          onPressed: (){
          },
                 icon: Icon(Icons.favorite_border, color: Colors.black),
        ),
         ],
        ),
    );



    final bottomContentText = Column(
      children: <Widget>[
        iconrow,
        _buildDiv(),
        SizedBox(height: 16.0),
        Text('ABOUT', style: TextStyle(color: Colors.grey, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5.0),
        Text(
      '“Making Eyes,” the 2014 short from the video editor Sean Dunn, is about that kind of fleeting interaction one might share with a fellow commuter. The film begins at the West 4th Street station. Jay, a man on his way to his office job.',
      style: TextStyle(fontSize: 18.0),
      ),
        SizedBox(height: 10.0),
      ],
    );

    // geht noch nicht
    _launchURL() async {
      const url = 'https://flutter.dev';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: 300.0,
        child: RaisedButton(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          onPressed: _launchURL,
          color: Color.fromRGBO(0, 0, 0, 1.0),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(9.0),
              side: BorderSide(color: Colors.black)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage("images/paypal.png"), height: 30.0),
              Text("    TIP THE MAKERS", style: TextStyle(color: Colors.white, fontSize: 17)),
            ],
          ),
        ),
    );




    final bottomContent = Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, readButton],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}