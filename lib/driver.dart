import 'dart:async';
import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'request.dart';
import 'signin.dart';

class Driver extends StatefulWidget {
  @override
  DriverState createState() => DriverState();
}

class DriverState extends State<Driver> {
  double longitude, latitude;
  Timer timer;
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      driverLocation();
      const oneSecond = const Duration(seconds: 120);
      timer = Timer.periodic(oneSecond, (Timer t) => setState(() {}));
    });

    return Scaffold(
      appBar: new AppBar(
          title: new Text("Welcome"), backgroundColor: Colors.black),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(
                name,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              accountEmail: new Text(
                email,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              decoration: new BoxDecoration(
                color: Colors.black,
                
              ),
              currentAccountPicture:
                  CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
            ),
            new ListTile(
                leading: Icon(Icons.directions_bike),
                title: new Text("Your rides"),
                onTap: () {
                  Navigator.pop(context);
                }),
            
            new ListTile(
                leading: Icon(Icons.help),
                title: new Text("Help"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.settings),
                title: new Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.power_settings_new),
                title: new Text("Logout"),
                onTap: () {
                  signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }), ModalRoute.withName('/'));
                }),
          ],
        ),
      ),
    );
  }
}
