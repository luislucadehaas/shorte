import 'package:flutter/material.dart';
import 'package:shortefilmfestival/screens/home/download.dart';
import 'package:shortefilmfestival/screens/home/quest.dart';
import 'package:shortefilmfestival/screens/home/settings.dart';
import 'package:shortefilmfestival/screens/home/stream.dart';
import 'package:shortefilmfestival/screens/onboarding.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Shorte',
      theme: new ThemeData(primaryColor: Color.fromRGBO(0, 0, 0, 1.0)),
      home: new ListPage(title: 'Stream'),
    );
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  int _selectedTab = 0;
  final _pageOptions = [
    Stream(),
    Download(),
    GenreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(0, 0, 0, 1.0),
      title: Image.asset('images/shorte.png', fit: BoxFit.contain, height: 28),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.more_vert,size: 30.0, color: Colors.grey),
          onPressed: () {
           Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Settings()),
            );
          },
        )
      ],
    );


    final makeBottom = Container(
      height: 90.0,
      child: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(0, 0, 0, 1.0),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedTab,
        onTap: (int index) {
          setState(() {
            _selectedTab = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            title: Text('Stream'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_downward),
            title: Text('Download'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.label),
            title: Text('Quest'),
          ),
        ],
      ),
    );


    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1.0),
      appBar: topAppBar,
      body: _pageOptions[_selectedTab],
      bottomNavigationBar: makeBottom,

    );
  }
}