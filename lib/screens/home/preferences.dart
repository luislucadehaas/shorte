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
          SizedBox(height: 70),
          Center(
            child: Container(
              width: 360,
               height: 150,
               child: Text("Welcome to Shorte! To accuratly curate your weekly Stream  of Short Films please select your preferences", textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,
                   maxLines: 5,style: TextStyle(height: 1.5,color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),)),
          ),
          SizedBox(height: 30),
          //Expanded(child: SamplePage()),
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

/*
class SamplePage extends StatefulWidget {
  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  List<bool> isSelected;

  @override
  void initState() {
    isSelected = [false, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ToggleButtons(
              borderColor: Colors.grey,
              color: Colors.grey,
              borderWidth: 2,
              selectedBorderColor: Colors.white,
              selectedColor: Colors.white,
              borderRadius: BorderRadius.circular(15),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Open 24 Hours',
                    style: TextStyle(fontSize: 16),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Custom Hours',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
              onPressed: (int index) {
                setState(() {
                  isSelected[index] = !isSelected[index];
                });
              },
              isSelected: isSelected,
            ),
          ],
        ),
    );
  }
}
*/


