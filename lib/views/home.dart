import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Function logout;
  Home({this.logout});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
        RaisedButton(
          padding: EdgeInsets.all(20),
          onPressed: this.logout,
          child: Text("Log Out"),
        )
    );
  }
}