import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shortefilmfestival/screens/authenticate/log_in.dart';
import 'package:shortefilmfestival/screens/home/home.dart';
import 'package:shortefilmfestival/screens/home/stream.dart';
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
          SizedBox(height: 90),
          Center(
            child: Container(
              width: 360,
               height: 150,
               child: Text("Welcome to Shorte! To accuratly curate your weekly Stream  of Short Films please select your preferences", textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,
                   maxLines: 5,style: TextStyle(height: 1.5,color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),)),
          ),
          SizedBox(height: 20),
          Container(
              height: 380,
              child: MyHomePage()),
          SizedBox(height: 20),
          //Expanded(child: MyHomePage()),
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> reportList = [
    "Action",
    "Animations",
    "Comedy",
    "Documnetary",
    "Drama",
    "Romance",
    "Thriller",
    "Science Fiction & Fantasy",

  ];

  List<String> selectedReportList = List();

  _showReportDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          //Here we will build the content of the dialog
          return Container(
            child: MultiSelectChip(
              reportList,
              onSelectionChanged: (selectedList) {
                setState(() {
                  selectedReportList = selectedList;
                });
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          Container(
            width: 350,
           child: MultiSelectChip(
          reportList,
          onSelectionChanged: (selectedList) {
            setState(() {
              selectedReportList = selectedList;
            });
          },
        ),
      ),
            RaisedButton(
              shape: StadiumBorder(),
              textColor: Colors.black,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 15, bottom: 15),
                child: Text("Save & Enjoy", style: TextStyle(fontSize: 20),),
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );

              }
            ),
            //Text(selectedReportList.join(" , "), style: TextStyle(color: Colors.white, fontSize: 15)),
          ],
        ),
      ),
    );
  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged;

  MultiSelectChip(this.reportList, {this.onSelectionChanged});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  // String selectedChoice = "";
  List<String> selectedChoices = List();

  _buildChoiceList() {
    List<Widget> choices = List();

    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: FilterChip(
          padding: EdgeInsets.only(left: 12, right: 12),
          selectedColor: Colors.white,
          backgroundColor: Color.fromRGBO(128, 128, 128, 0.5),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),

          ),

          label: Text(item, style: TextStyle(fontSize: 15),),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              widget.onSelectionChanged(selectedChoices);
            });
          },
        ),
      ));
    });

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
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
              c
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


