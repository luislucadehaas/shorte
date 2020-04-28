import 'package:flutter/material.dart';
import 'package:shortefilmfestival/screens/home/home.dart';
import 'package:shortefilmfestival/screens/home/preferences.dart';
import 'package:shortefilmfestival/services/sign_in.dart';
import 'package:flare_flutter/flare_actor.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  AuthService auth = AuthService();
  @override
  void initState() {
    super.initState();
    auth.getUser.then(
          (user) {
        if (user != null) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {return Home();},
          ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage("images/shorte.png")),
              SizedBox(height: 50),
              _signInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () async{
        var user = await auth.googleSignIn();
        if (user != null) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {return Preference();},),);
        };
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("images/google_logo.png"), height: 30.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
