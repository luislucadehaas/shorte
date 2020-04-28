import 'package:cloud_firestore/cloud_firestore.dart';

class Report {
  String uid;
  int total;
  dynamic films;

  Report({ this.uid, this.films, this.total });

  factory Report.fromMap(Map data) {
    return Report(
      uid: data['uid'],
      total: data['total'] ?? 0,
      films: data['films'] ?? {},
    );
  }

}

/////// Database Collections

class Film {
  String id;
  String title;
  String description;
  String url;
  String picture;
  String country;
  String time;
  String director;
  String year;
  String genre;
  Timestamp created_at;

  Film({ this.title, this.url, this.picture, this.description, this.id, this.time,this.year,this.country,this.director, this.genre, this.created_at});

  factory Film.fromMap(Map data) {
    return Film(
        id: data['id'] ?? '',
        time: data['time'] ?? '',
        country: data['country'] ?? '',
        year: data['year'] ?? '',
        director: data['director'] ?? '',
        title: data['title'] ?? '',
        url: data['url'] ?? '',
        description: data['description'] ?? '',
        picture: data['picture'] ?? 'default.png',
        genre: data['genre'] ?? '',
      created_at: data['created_at'] ?? '',
    );
  }

}
//
//
class Genre {
  final String id;
  final String color;
  final int r ;
  final int g ;
  final int b ;
  final String title;
  final List<Film> films;

  Genre({ this.color, this.title, this.films, this.id, this.r, this.g, this.b  });

  factory Genre.fromMap(Map data) {
    return Genre(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      r: data['r'] ?? 0,
      g: data['g'] ?? 0,
      b: data['b'] ?? 0,
      films:  (data['films'] as List ?? []).map((v) => Film.fromMap(v)).toList(), //data['films'],
    );
  }
}

  class Special {
    final String id;
    final int r ;
    final int g ;
    final int b ;
    final String image ;
    final String title;
    final List<Film> films;

  Special({ this.title, this.films, this.id, this.r, this.g, this.b, this.image });

  factory Special.fromMap(Map data) {
    return Special(
    id: data['id'] ?? '',
    title: data['title'] ?? '',
    r: data['r'] ?? 0,
    g: data['g'] ?? 0,
    b: data['b'] ?? 0,
    image: data['image'] ?? 'default.png',
    films:  (data['films'] as List ?? []).map((v) => Film.fromMap(v)).toList(), //data['films'],
    );
  }
}



