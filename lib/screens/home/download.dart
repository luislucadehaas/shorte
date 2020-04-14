import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class Download extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
        color: Colors.grey,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Image(image: AssetImage("images/mirage-coming-soon.png"), height: 160.0)

          ],
         ),
       ),
      ),
    );
  }
}
