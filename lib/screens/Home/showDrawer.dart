import 'package:flutter/material.dart';
import 'package:getit/screens/Home/myAppotiments.dart';
import 'package:getit/screens/Registration/registrationOfUser.dart';
import 'package:getit/services/authService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowDrawer extends StatelessWidget {
  String userId;

  String userName = "Welcome";

  ShowDrawer({this.userId})
  {
Future<SharedPreferences> setData = SharedPreferences.getInstance();
setData.then(
  (data)=>{
              this.userName=  "Welcome " +  data.getString("patient name")
        }
);
  }
  

  @override
  Widget build(BuildContext context) {
    print(this.userId + "iama from show drawer");
    return Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          margin: EdgeInsets.all(20),
          child: Text(this.userName),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('Home Page'),
          onTap: () {
            Navigator.of(context).pop();
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: Text('My Appointments'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyAppotiments(
                  userId: this.userId,
                ),
                // settings: RouteSettings(
                //   arguments: [catgary[index],this.userid],
                // ),
              ),
            );
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: Text('Logout'),
          onTap: () {
            AuthService()
                .signOut(context)
                .then((onValue) {})
                .catchError((onError) {});

            // Update the state of the app.
            // ...
          },
        ),
      ],
    ));
  }
}
