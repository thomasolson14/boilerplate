import 'package:boilerplate/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: "Phone Number"),
                inputFormatters:  [ LengthLimitingTextInputFormatter(10),
                                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                  ],
              keyboardType: TextInputType.number,
            ),
            SizedBox(height:20),
            Container( 
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical:20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30)           ),
              child: Text("Sign in with Code", style: TextStyle(fontSize: 16, color: Colors.white)),
            )
          ]
        ),
      ),
    );
  }
}