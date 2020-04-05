import 'package:flutter/material.dart';
import 'package:getit/screens/ShareWidget/constart.dart';
import 'package:getit/screens/auth/displayFrom.dart';
import 'package:getit/services/database.dart';

class RegistrationOfUser extends StatelessWidget {
  String firstName;
  String lastName;
  int age ;
  String gender;
  String city;
  String uid;
  RegistrationOfUser({
    this.uid
  });
  @override
  Widget build(BuildContext context) {
    final _formkey5 = GlobalKey<FormState>();
    return SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
            
              child: Text(
            "Registation Page",
            textAlign: TextAlign.center,
          )),
          Container(
            margin: EdgeInsets.all(20),
            child: Form(
              key: _formkey5,
              child: SingleChildScrollView(
                reverse: true,
                            child: Column(
                  children: <Widget>[

                    TextFormField(
                      decoration:  textInputDecarator.copyWith(hintText:"First Name"),
                      onChanged: (val){
                        this.firstName = val;
                      },
                      validator: (val)=>val.length<=1?'Enter First Name':null,
                      
                      

                    ),
                    TextFormField(
                      decoration:  textInputDecarator.copyWith(hintText:"Last Name"),
                       onChanged: (val){
                        this.lastName = val;
                      },
                      validator: (val)=>val.length<=1?'Enter Last Name':null,

                    ),
                    TextFormField(
                      decoration:  textInputDecarator.copyWith(hintText:"age"),
                      validator: (val)=>val.length>2 || val.length==0?'Enter coreect age':null,

                      keyboardType: TextInputType.number,
                      onChanged: (val){
                        this.age = int.parse(val);
                      },

                    ),
                    TextFormField(
                      decoration:  textInputDecarator.copyWith(hintText:"Gender"),
                      onChanged: (val){
                        this.gender = val;
                      },
                      validator: (val)=>val.length<=1?'Enter Gender':null,

                    ),
                     TextFormField(
                      decoration:  textInputDecarator.copyWith(hintText:"City"),
                      onChanged: (val){
                        this.city = val;
                      },
validator: (val)=>val.length<=1?'Enter City':null,
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      child: Text("Submit"),
                      onPressed: (){
                        if (_formkey5.currentState.validate()) {
                          dynamic result = DataBaseServices().registerUser(
                            this.uid,
                            this.firstName,
                            this.lastName,
                            this.age,
                            this.gender,
                            this.city

                          );
                          print(result);
                        }

                    })
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
