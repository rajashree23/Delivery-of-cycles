import 'dart:async';

// import 'package:flutter_google_places/flutter_google_places.dart';

import 'package:flutter/material.dart';
// import 'package:google_maps_webservice/places.dart';
// import 'autocomplete.dart';
// import 'package:sign_in_flutter/loginpage.dart';
// import 'package:sign_in_flutter/signin.dart';
// import 'loginpage.dart';
import 'loginpage.dart';
// import 'package:geolocator/geolocator.dart';
import 'signin.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'request.dart';
// import 'package:http/http.dart' as http;

// GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class IdleDriver extends StatefulWidget {
  @override
  IdleDriverState createState() => IdleDriverState();
}

class IdleDriverState extends State<IdleDriver> {
  // Completer<GoogleMapController> _controller = Completer();
  // double longitude, latitude;
  String _homeScreenText = "Waiting for token...";
  String _messageText = "Waiting for message...";
  
  bool st = false;
  Timer timer;
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width; // Using this line I got the device screen width
    setState(() {
      // pushMessagingExample();
      if (st == false)
        driverTime(context).then((int n) => setState(() {
              if (n == 0) {
                st = false;
              } else {
                st = true;
              }
            }));
      //else
      //st=false;
      const oneSecond = const Duration(seconds: 300);
      timer = Timer.periodic(oneSecond, (Timer t) => setState(() {}));
      // pushMessagingExample();
    });
    // pushMessagingExample();
    return new Scaffold(
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
                  //   image: new DecorationImage(
                  //     image: new ExactAssetImage('assets/face.png'),
                  //     fit: BoxFit.cover,
                  //   ),
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
                  leading: Icon(Icons.payment),
                  title: new Text("Payment"),
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
        body: Material(
          child: Column(
            children: <Widget>[
              Center(
                child: Text(_homeScreenText),
              ),
              Row(children: <Widget>[
                Expanded(
                  child: Text(_messageText),
                ),
              ])
            ],
          ),
        ));
  }

  // void pushMessagingExample() {
  //   // String _homeScreenText = "Waiting for token...";
  //   // String _messageText = "Waiting for message...";
  //   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  //   _firebaseMessaging.configure(
  //     onMessage: (Map<String, dynamic> message) async {
  //       setState(() {
  //         _messageText = "Push Messaging message: $message";
  //       });
  //       print("onMessage: $message");
  //     },
  //     onLaunch: (Map<String, dynamic> message) async {
  //       setState(() {
  //         _messageText = "Push Messaging message: $message";
  //       });
  //       print("onLaunch: $message");
  //     },
  //     onResume: (Map<String, dynamic> message) async {
  //       setState(() {
  //         _messageText = "Push Messaging message: $message";
  //       });
  //       print("onResume: $message");
  //     },
  //   );
  //   _firebaseMessaging.requestNotificationPermissions(
  //       const IosNotificationSettings(sound: true, badge: true, alert: true));
  //   _firebaseMessaging.onIosSettingsRegistered
  //       .listen((IosNotificationSettings settings) {
  //     print("Settings registered: $settings");
  //   });
  //   _firebaseMessaging.getToken().then((String token) {
  //     assert(token != null);
  //     setState(() {
  //       _homeScreenText = "Push Messaging token: $token";
  //     });
  //     print(_homeScreenText);
  //   });
  // }

}
