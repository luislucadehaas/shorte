import 'package:flutter/material.dart';
import 'package:shortefilmfestival/model/models.dart';
import 'package:shortefilmfestival/screens/home/detail.dart';
import 'package:shortefilmfestival/screens/home/list.dart';
import 'package:shortefilmfestival/services/globals.dart';
import 'package:shortefilmfestival/shared/loader.dart';
import 'package:floating_search_bar/floating_search_bar.dart';



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

            body: Container(
                padding: EdgeInsets.only(top:10),
              child: ListView(
                children: genres.map((genre) => GenreItem(genre: genre)).toList(),
              ),
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
      height: 90,
        child: Card(

        elevation: 8.0,
        clipBehavior: Clip.antiAlias,
        margin: new EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
           child: Container(
           decoration: BoxDecoration(color: Color.fromRGBO(genre.r, genre.g, genre.b,1)),
            child: InkWell(
             onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => Search(),
                ),
              );
             },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 0),
                        child: Text(
                          genre.title, style: TextStyle(color: Colors.black, fontSize: 23 ,fontWeight: FontWeight.bold)),
                        ),
                      //trailing:
                      //Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0)),
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


