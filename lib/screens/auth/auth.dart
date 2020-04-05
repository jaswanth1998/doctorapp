import 'package:flutter/material.dart';
import 'package:getit/screens/ShareWidget/loding.dart';
import 'package:getit/screens/auth/displayFrom.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  // final _formkey1 = GlobalKey<FormState>();
  String phoneNum = "";
  bool checkOtp = true;
  bool mask = false;
  @override
  Widget build(BuildContext context) {

    return  

     Scaffold(
      body: Container(
        color: Color.fromRGBO(51, 153, 204, 1),
        child: Column(
          children: <Widget>[
            SizedBox(height: 40),
            Text(
              "Welcome to  Doctor's Token",
              style: TextStyle(fontSize: 34, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            new Image.asset('assests/splash.gif')
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.lightBlueAccent,
        child: Wrap(
            // margin: EdgeInsets.all(20),

            children: <Widget>[
              DisplayFrom(),
            ]),
      ),
    );
  }
}
