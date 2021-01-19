import 'package:boilerplate/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPhone extends StatefulWidget {
  final Function checkPhoneNumber; 

  InputPhone({this.checkPhoneNumber});
  @override
  _InputPhoneState createState() => _InputPhoneState();
}

class _InputPhoneState extends State<InputPhone> {
  @override
  Widget build(BuildContext context) {

    TextEditingController phoneController = new TextEditingController();

    return 
      Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: phoneController,
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
            InkWell(
              onTap: (){
                String p = phoneController.text;
                if (p.length == 10 && RegExp(r'[0-9]').hasMatch(p)){
                  this.widget.checkPhoneNumber(phoneController.text);
                } else {
                  print("invalid number");
                  //show user its an error
                }

                
              },
              child: Container( 
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical:20),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30)           ),
                child: Text("Sign in with Code", style: TextStyle(fontSize: 16, color: Colors.white))
              )
            )
          ]
        ),
      );
  }
}