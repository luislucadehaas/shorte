import 'package:firebase_auth/firebase_auth.dart';
import 'package:shortefilmfestival/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:provider/provider.dart';
import 'package:shortefilmfestival/services/sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
          StreamProvider<FirebaseUser>.value(
              value: AuthService().user)
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
            navigatorObservers: [
              FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
            ],

            theme: ThemeData(
              // your customizations here
              brightness: Brightness.dark,
            ),
            home: Wrapper(),
          ),
    );
  }

}