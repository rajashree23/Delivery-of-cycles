import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:sign_in_flutter/loginpage.dart';
// import 'package:sign_in_flutter/signin.dart';
// import 'loginpage.dart';
import 'signin.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FirstScreen extends StatefulWidget {
  @override
  FirstScreenState createState() => FirstScreenState();
}

class FirstScreenState extends State<FirstScreen> {
  Completer<GoogleMapController> _controller = Completer();
  double longitude, latitude;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Welcome")
      ),
      // body: Container(
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment.topRight,
      //       end: Alignment.bottomLeft,
      //       colors: [Colors.blue[100], Colors.blue[400]],
      //     ),
      //   ),
      drawer: Drawer(
        child: ListView(
          // child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // CircleAvatar(
            //   backgroundImage: NetworkImage(
            //     imageUrl,
            //   ),
            //   radius: 60,
            //   backgroundColor: Colors.transparent,
            // ),
            // SizedBox(height: 40),
            // Text(
            //   'NAME',
            //   style: TextStyle(
            //       fontSize: 15,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.black54),
            // ),
            new UserAccountsDrawerHeader(
                accountName: new Text(
                  name,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                ),
                accountEmail: new Text(
                  email,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                )),
            // Text(
            //   email,
            //   style: TextStyle(
            //       fontSize: 25,
            //       color: Colors.deepPurple,
            //       fontWeight: FontWeight.bold),
            // ),
            // SizedBox(height: 40),

            // RaisedButton(
            //   onPressed: () {
            //     signOutGoogle();
            //     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginPage();}), ModalRoute.withName('/'));
            //   },
            //   color: Colors.deepPurple,
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Text(
            //       'Sign Out',
            //       style: TextStyle(fontSize: 25, color: Colors.white),
            //     ),
            //   ),
            //   elevation: 5,
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(40)),
            // )
          ],
        ),
      ),
    );
  }
}
