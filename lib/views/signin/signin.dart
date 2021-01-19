import 'package:boilerplate/views/signin/inputPhone.dart';
import 'package:boilerplate/views/signin/verificationCode.dart';
import 'package:boilerplate/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:boilerplate/models/user.dart';

enum Screen {
  phone,
  code,
  loading
}

class SignIn extends StatefulWidget {
  final Function verificationComplete;

  SignIn({this.verificationComplete});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  Screen screen = Screen.phone;
  String phone;
  int signinAttemptsCount = 0;
  bool showError = false;

  @override
  Widget build(BuildContext context) {

    Function checkPhoneNumber = (String p){
      print(p);
      //call firebase.
      setState(() =>{phone = p});
      setState(() =>{screen = Screen.loading});
      print("Sending to Firebase");
      //await response.
      //if response is good
      setState(() =>{screen = Screen.code});

      print(screen);

      
    };

    Function checkCode = (String c){
      setState(() =>{screen = Screen.loading});
      //call firebase.
      print("Sending to Firebase");
      
      //if code is correct
        //verificationComplete(user);
        this.widget.verificationComplete(new User(userID: '123', token: 'token'));
      //else
        //show error
        //this.widget.signinAttemptsCount++;
      

    };

    Function back = (){
      print("back");
      setState(() =>{phone = ""});
      setState(() =>{signinAttemptsCount++});
      //send cancelation to firebase.
      setState(() =>{screen = Screen.phone});
    };

    Widget getScreen(screen) {
      switch(screen) {
        case Screen.phone: 
          return InputPhone(checkPhoneNumber: checkPhoneNumber);
          break;
        case Screen.code: 
          return VerificationCode(checkCode: checkCode, back: back);
          break;
        case Screen.loading:
          return Container(child: Text("loading"));
          break;
        default:
           return Container();
      }
    }

    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: getScreen(screen),
      ),
    );
  }
}