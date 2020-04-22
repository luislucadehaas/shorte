

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
//  Timestamp created_at;

  List<Film> films;

  Film({ this.title, this.url, this.picture, this.description, this.id, this.time,this.year,this.country,this.director});

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
        picture: data['picture'] ?? '',
    );
  }

}
//
//
class Genre {
  final String id;
  final String color;
  final String title;
  final List<Film> films;

  Genre({ this.color, this.title, this.films, this.id  });

  factory Genre.fromMap(Map data) {
    return Genre(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      color: data['color'] ?? '',
      films:  (data['films'] as List ?? []).map((v) => Film.fromMap(v)).toList(), //data['films'],
    );
  }

}


