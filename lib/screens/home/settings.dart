import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shortefilmfestival/screens/authenticate/log_in.dart';
import 'package:shortefilmfestival/screens/home/preferences.dart';
import 'package:shortefilmfestival/services/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:shortefilmfestival/services/sign_in.dart';





class Settings extends StatelessWidget {
  final AuthService auth = AuthService();
  @override
  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<FirebaseUser>(context);

    if (user != null) {
      return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Settings',
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              const SizedBox(height: 10.0),
              Card(
                elevation: 0.5,
                margin: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 0,
                ),
                child: Column(
                  children: <Widget>[
                    ListTile(

                      title: Text(user.email ?? 'Default value'),
                      onTap: () {},
                    ),
                    _buildDivider(),
                    ListTile(

                      title: Text("Subscription:  FREE"),
                      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0,),
                child: Column(
                  children: <Widget>[
                    MergeSemantics(
                      child: ListTile(
                        title: Text('Receive Notifications'),
                        trailing: CupertinoSwitch(
                          activeColor: Colors.black,
                          value: true,
                          onChanged: (bool value) {},
                        ),
                        onTap: () {},
                      ),
                    ),
                    _buildDivider(),
                    ListTile(

                      title: Text("Preferences"),
                      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Preference()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0,),
                child: ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text("Logout"),
                  onTap: () async{
                    await auth.signOut();
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginPage();}), ModalRoute.withName('/'));

                  },
                ),
              ),
              const SizedBox(height: 60.0),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
          body: Container(
          color: Colors.black,
        ),
      );
    }
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}

