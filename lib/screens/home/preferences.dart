import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shortefilmfestival/screens/authenticate/log_in.dart';
import 'package:shortefilmfestival/services/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:shortefilmfestival/services/sign_in.dart';


class Preference extends StatelessWidget {
  final AuthService auth = AuthService();
  @override

  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    if (user != null) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1.0),
      body:
      Column(
        children: <Widget>[
          SizedBox(height: 80),
          Center(
            child: Container(
              width: 360,
               child: Text("Welcome to Shorte Luis! To accuratly curate your weekly Stream  of Short Films please select your preferences", textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,
                   maxLines: 5,style: TextStyle(height: 1.5,color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),)),
          ),
          SizedBox(height: 10),

          SizedBox(height: 20),

          SizedBox(height: 10),

        ],
      ),

    );
  } else {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Text("This is an error please restart the App"),
       ),
    );
  }
}
}

