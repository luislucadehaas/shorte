import 'package:flutter/material.dart';
import 'package:shortefilmfestival/model/models.dart';
import 'package:shortefilmfestival/screens/home/detail.dart';
import 'package:shortefilmfestival/services/globals.dart';
import 'package:shortefilmfestival/shared/loader.dart';




class GenreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
          return Scaffold(
            backgroundColor: Color.fromRGBO(0, 0, 0, 1.0),
             body:
              Column(
                  children: <Widget>[
                    SizedBox(height: 20),
               Text2(),
                    SizedBox(height: 20),
               Special(),
                SizedBox(height: 20),
                    Text1(),
                    SizedBox(height: 10),
              Expanded(child: Genres()),
                  ],
            ),

          );
  }
}

class Genres extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Global.genresRef.getData(),
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.hasData) {
          List<Genre> genres = snap.data;
          return Scaffold(
            backgroundColor: Color.fromRGBO(0, 0, 0, 1.0),

            body:  ListView(
                    children: genres.map((genre) => GenreItem(genre: genre)).toList(),),


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
      height: 70,
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
                  builder: (BuildContext context) => Search(genre: genre),
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
                ),],
            ),
          ),
        ),
      ),
    );
  }
}

class Channels extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Global.specialsRef.getData(),
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.hasData) {
          List<Special> specials = snap.data;
          return Scaffold(
            backgroundColor: Color.fromRGBO(0, 0, 0, 1.0),

            body:
                Container(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: specials.map((special) => Special(special: special)).toList(),),
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







class Search extends StatelessWidget {
  final Genre genre;
  Search({this.genre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(genre.title, style: TextStyle(fontWeight: FontWeight.bold)),

      ),
      body: ListView(children: [
              Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 0.0,
            ),
            width: double.infinity,
            height: 3.0,
            color: Color.fromRGBO(genre.r, genre.g, genre.b,1),
          ),
        FilmList(genre: genre)
      ]),
    );
  }
}


class Special extends StatelessWidget {
  final Special special;
  const Special({Key key, this.special}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
            child: Card(
        elevation: 8.0,
        clipBehavior: Clip.antiAlias,
        margin: new EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
           child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(2, 143, 22,1)),
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
                        "special.title", style: TextStyle(color: Colors.black, fontSize: 23 ,fontWeight: FontWeight.bold)),
                  ),
                ),],
            ),
          ),
        ),
      ),
    );
  }
}



class Text1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 17.0, left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Genres", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
          Text("See all Films", style: TextStyle(color: Colors.white, fontSize: 20, decoration: TextDecoration.underline),),
        ],
      ),
    );
  }
}

class Text2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, left: 15),
      child: Row(
        children: <Widget>[
          Text("Channels", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}

class FilmList extends StatelessWidget {
  final Genre genre;
  FilmList({Key key, this.genre});

  @override
  Widget build(BuildContext context) {

    return Column(
        children: genre.films.map((film) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            elevation: 4,
            margin: EdgeInsets.all(4),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => DetailPage(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(8),
                child: ListTile(
                  title: Text(
                    film.title,
                    //style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(
                    film.description,
                    overflow: TextOverflow.fade,
                    //style: Theme.of(context).textTheme.subhead,
                  ),
                ),
              ),
            ),
          );
        }).toList());
  }
}

/*

class Special1 extends StatelessWidget {
//  final Special special;
//
//  Special({this.special});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: PageView(
        controller: PageController(viewportFraction: 0.9),
        scrollDirection: Axis.horizontal,
        pageSnapping: true,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            color: Colors.redAccent,
            width: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            color: Colors.blueAccent,
            width: 10,
          ),
        ],
      ),
    );
  }
}
*/