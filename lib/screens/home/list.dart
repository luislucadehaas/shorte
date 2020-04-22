import 'package:flutter/material.dart';

import 'package:floating_search_bar/floating_search_bar.dart';


class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text(index.toString()),
          );
        },
        trailing: CircleAvatar(
          child: Text("RD"),
        ),

        onChanged: (String value) {},
        onTap: () {},
        decoration: InputDecoration.collapsed(
          hintText: "Search...",
        ),
    );
  }
}