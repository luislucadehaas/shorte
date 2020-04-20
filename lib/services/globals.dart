import 'package:shortefilmfestival/model/models.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'database.dart';



/// Static global state. Immutable services that do not care about build context.
class Global {
  // App Data
  static final String title = 'Shorte';

  // Services
  static final FirebaseAnalytics analytics = FirebaseAnalytics();

  // Data Models
  static final Map models = {
    Genre: (data) => Genre.fromMap(data),
    Film: (data) => Film.fromMap(data),
    Report: (data) => Report.fromMap(data),
  };
  static final Collection<Genre> genresRef = Collection<Genre>(path: 'genres');
  static final UserData<Report> reportRef = UserData<Report>(collection: 'reports');

}