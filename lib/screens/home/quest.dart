import 'package:flutter/material.dart';
import 'package:shortefilmfestival/model/models.dart';
import 'package:shortefilmfestival/services/globals.dart';
import 'package:shortefilmfestival/shared/loader.dart';



class GenreScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Global.genresRef.getData(),
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.hasData) {
          List<Genre> genres = snap.data;
          return Scaffold(
            backgroundColor: Color.fromRGBO(0, 0, 0, 1.0),

            body: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(10.0),
              crossAxisSpacing: 10.0,
              crossAxisCount: 1,
              children: genres.map((genre) => GenreItem(genre: genre)).toList(),
            ),
          );
        } else {
          //improve this loading screen functionality
          return LoadingScreen();
        }
      },
    );
  }
}


class GenreItem extends StatelessWidget {
  final Genre genre;
  const GenreItem({Key key, this.genre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
        elevation: 8.0,
        clipBehavior: Clip.antiAlias,
        margin: new EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
           child: Container(
           decoration: BoxDecoration(color: Color.fromRGBO(25, 225, 0, .5)),
            child: InkWell(
             onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => GenreScreen(),
                ),
              );
             },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          genre.title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                          //trailing:
                          //Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0)),
                    ),
                    // Text(topic.description)
                    ), ],
                ),
                // )
              //],
            ),
          ),
        ),
      );
  }
}

//class FilmList extends StatelessWidget {
//  final Genre genre;
//  GenreList({Key key, this.genre});
//
//  @override
//  Widget build(BuildContext context) {
//
//    return Column(
//        children: genre.films.map((film) {
//          return Card(
//            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//            elevation: 4,
//            margin: EdgeInsets.all(4),
//            child: InkWell(
//              onTap: () {
////                Navigator.of(context).push(
////                  MaterialPageRoute(
////                    builder: (BuildContext context) => FilmScreen(quizId: quiz.id),
////                  ),
////                );
//              },
//              child: Container(
//                padding: EdgeInsets.all(8),
//                child: ListTile(
//                  title: Text(
//                    film.title,
//                    style: Theme.of(context).textTheme.title,
//                  ),
//                  subtitle: Text(
//                    film.description,
//                    overflow: TextOverflow.fade,
//                  ),
//                ),
//              ),
//            ),
//          );
//        }).toList());
//  }
//}
//


//import 'package:flutter/material.dart';

//class Quest extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//
//    final makeListTile = ListTile(
//        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//        leading: Container(
//          padding: EdgeInsets.only(right: 12.0),
//          decoration: new BoxDecoration(
//              border: new Border(
//                  right: new BorderSide(width: 1.0, color: Colors.black26))),
//          child: Icon(Icons.autorenew, color: Colors.black),
//        ),
//        title: Text(
//          "Horror",
//          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
//
//        trailing:
//        Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0));
//
//    final makeCard = Card(
//      elevation: 8.0,
//      margin: new EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
//      child: Container(
//        decoration: BoxDecoration(color: Color.fromRGBO(25, 225, 0, .5)),
//        child: makeListTile,
//      ),
//    );
//
//
//    final makeBody = Container(
//
//      child: ListView.builder(
//        scrollDirection: Axis.vertical,
//        shrinkWrap: true,
//        itemCount: 6,
//        itemBuilder: (BuildContext context, int index) {
//          return makeCard;
//        },
//      ),
//    );
//    return Scaffold(
//      backgroundColor: Color.fromRGBO(0, 0, 0, 1.0),
//
//      body: makeBody,
//    );
//  }
//}
