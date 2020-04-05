import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getit/models/appotimentModel.dart';
import 'package:getit/screens/Home/LiveToken.dart';

class MyAppotiments extends StatefulWidget {

  String userId;
  MyAppotiments({
    this.userId
  });
  @override
  _MyAppotimentsState createState() => _MyAppotimentsState(userId: this.userId);
}

class _MyAppotimentsState extends State<MyAppotiments> {
    String userId;
  _MyAppotimentsState({
    this.userId
  });
  
  List<AppotimentModel> data = [];

  List<Text> data1 = [];
  @override
  Widget build(BuildContext context) {
    print(this.userId+" iam ffrom appointents");
    return Scaffold(
      appBar: AppBar(
        title: Text("My Appointments"),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("Appotiments")
        .where("Patent Uid",isEqualTo: userId)
        .where("status",isEqualTo:"success")
        
        .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            print("Loading");
            return Text("Loading");
          }
          var userDocument = snapshot;

          this.data = (userDocument.data.documents.map((useData) {
            return AppotimentModel(
              
            useData["status"],
             useData["CompletedAt"],
             doctorName: useData["Doctor Name"],
             tokenNum: useData["token"],
             doctorid: useData['Doctor User ID']
             
            //  useData["Doctor User ID"],
            //  useData["status"],

            );
          })).toList();
          return SingleChildScrollView(
            child: Column(
                children: data.map((appotiment) {
                    print(appotiment.datenow);
              // return Text(appotiment.datenow.toString());
              return Card(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text("\n Doctor Name:   "+appotiment.doctorName+"        \n"),
                    Text(appotiment.datenow +"\n"),
                     appotiment.tokenNum ==0? Text("wating  token Number "+ appotiment.tokenNum.toString()):
                     Text("Your token Number "+ appotiment.tokenNum.toString())
                     ,
                    //  LiveToken(userId: "ok"),
                    StreamBuilder(
          


          stream: Firestore.instance.collection("LiveToken")

        .where("Uid",isEqualTo: appotiment.doctorid)
        
        
        .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
           var userDocument = snapshot;
           print("iam doc1");
           print(appotiment.doctorid);
           int check = -2;

          this.data1 = (userDocument.data.documents.map((useData) {
            print("iam doc2");
            check = useData["Token"];
            
          })).toList();
          print(("i am here4"));
          if(check == -2){
return Text("NO Live Token");
          }else{
            return Text("Live Token "+check.toString());
          }
          
          // return Text(snapshot.data.documentChanges.map((f)));
        }
        ),
                    Text("Still pending with doctor \n"),
                    

                  ],
                )
                );
            }).toList()),
          );
        },
      ),
    );
  }
}
