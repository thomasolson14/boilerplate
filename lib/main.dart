import 'package:boilerplate/models/user.dart';
import 'package:boilerplate/views/home.dart';
import 'package:flutter/material.dart';
import 'views/signin/signin.dart';
//import 'views/signin/verificationCode.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  // This widget is the root of your application.
  User user;
  App({this.user});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App>{
  @override
  Widget build(BuildContext context) {
    Widget screen;

    if(this.widget.user == null){
      screen = SignIn(verificationComplete: (User user) => {setState(()=>{this.widget.user = user})});
    } else {
      screen = Home(logout: () => {setState(() => {this.widget.user = null})});
    }


    return MaterialApp(
      title: 'Boilerplate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: screen,
    );
  }
}