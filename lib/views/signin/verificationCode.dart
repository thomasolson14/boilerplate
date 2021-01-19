import 'package:boilerplate/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationCode extends StatefulWidget {
  final Function checkCode;
  final Function back;
  VerificationCode({this.checkCode, this.back});

  @override
  _VerificationCodeState createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {

  TextEditingController codeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: "Enter Verification Code"),
                inputFormatters:  [ LengthLimitingTextInputFormatter(10),
                                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                  ],
              keyboardType: TextInputType.number,
            ),
            SizedBox(height:40),
            InkWell(
              onTap: () => {
                this.widget.checkCode(codeController.text)
              },
              child: 
                Container( 
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical:20),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30)           ),
                  child: Text("Verify", style: TextStyle(fontSize: 16, color: Colors.white)),
                )
            ),
            SizedBox(height:10),
            InkWell(
              onTap: () => {
                this.widget.back()
              },
              child: 
                Container( 
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical:20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(30)           ),
                  child: Text("Back", style: TextStyle(fontSize: 16, color: Colors.blue)),
                )
            )
          ]
        ),
    );
  }
}