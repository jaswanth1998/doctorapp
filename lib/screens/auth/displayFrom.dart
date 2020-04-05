import 'package:flutter/material.dart';
import 'package:getit/screens/auth/auth.dart';
import 'package:getit/services/authService.dart';

class DisplayFrom extends StatefulWidget {
  @override
  _DisplayFromState createState() => _DisplayFromState();
}

class _DisplayFromState extends State<DisplayFrom> {
  AuthService userauthservice = AuthService();
  final _formkey1 = GlobalKey<FormState>();
  String phoneNum = "";
  String sendOtp = "";
  bool checkOtp = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.all(20),
      child: Form(
          // key: _formkey,
          key: _formkey1,
          child: Column(
            children: <Widget>[
              checkOtp
                  ? TextFormField(
                      // decoration:  textInputDecarator.copyWith(hintText: "Password"),
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                        prefixText: "+91 ",
                      ),
                      // obscureText: true,
                      keyboardType: TextInputType.number,

                      validator: (val) => val.length == 10
                          ? null
                          : "Enter 10 Digits Phone Number",
                      onChanged: (val) {
                        this.phoneNum = val;

                        // setState(() {
                        //   // this.password = val;
                        // });
                      },
                    )
                  : Column(
                      children: <Widget>[
                        TextFormField(
                          // decoration:  textInputDecarator.copyWith(hintText: "Password"),
                          decoration: InputDecoration(
                            hintText: "OTP",
                            // prefixText: "+91 ",
                          ),
                          obscureText: true,
                          keyboardType: TextInputType.number,

                          validator: (val) =>
                              val.length == 6 ? null : "Enter Six Digts OTP",
                          onChanged: (val) {
                            this.sendOtp = val;

                            // setState(() {
                            //   // this.password = val;
                            // });
                          },
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                this.checkOtp = !checkOtp;
                              });
                            },
                            child: Text("Change $phoneNum Phone Number")),
                      ],
                    ),
              SizedBox(
                height: 12,
              ),

          checkOtp
                  ? RaisedButton(
                      child: Text("Get Otp"),
                      onPressed: () {
                        if (_formkey1.currentState.validate()) {
                          setState(() {
                            this.checkOtp = !checkOtp;
                          });
                          userauthservice.loginWithPhoneNumber(
                              this.phoneNum, context);
                        }
                      },
                    )
                  : RaisedButton(
                      child: Text("Sign IN"),
                      onPressed: () {
                        setState(() {
                          // this.checkOtp = !checkOtp;
                          if (_formkey1.currentState.validate()) {
                            
                            userauthservice.verifyWithCode(
                                this.sendOtp, context);
                            //     setState(() {
                            //   this.checkOtp = !checkOtp;

                            // });
                            print("Sign IN");
                          }
                        });
                      },
                    ),
                                  
            ],
          )),
    );
  }
}
