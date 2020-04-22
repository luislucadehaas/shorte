import 'package:flutter/material.dart';

import 'package:floating_search_bar/floating_search_bar.dart';


class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "genre.title",
        ),
      ),
      body: FloatingSearchBar.builder(
        padding: EdgeInsets.only(top: 10.0),

        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text(index.toString()),
          );
        },
      trailing: Icon(Icons.search, color: Colors.grey, size: 30.0),

        onChanged: (String value) {},
        onTap: () {},
        decoration: InputDecoration.collapsed(
          hintText: "Search Short Films...",
        ),
      ),
    );
  }
}