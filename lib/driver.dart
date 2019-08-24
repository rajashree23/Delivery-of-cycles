import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_google_places/flutter_google_places.dart';

import 'package:flutter/material.dart';

import 'package:google_maps_webservice/places.dart';
// import 'autocomplete.dart';
// import 'package:sign_in_flutter/loginpage.dart';
// import 'package:sign_in_flutter/signin.dart';
// import 'loginpage.dart';
import 'loginpage.dart';
// import 'package:geolocator/geolocator.dart';

import 'signin.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'request.dart';
// import 'package:http/http.dart' as http;

// GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class Driver extends StatefulWidget {
  @override
  DriverState createState() => DriverState();
}

class DriverState extends State<Driver> {
  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  Completer<GoogleMapController> _controller = Completer();
  double longitude, latitude;
//   @override
//  void initState() {
//    super.initState();
//   flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
//     var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
//     var iOS = new IOSInitializationSettings();
//     var initSetttings = new InitializationSettings(android,iOS);
//     flutterLocalNotificationsPlugin.initialize(initSetttings,
        
//         onSelectNotification: onSelectNotification);
//   }

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width; // Using this line I got the device screen width

    return new Scaffold(
      appBar:
          new AppBar(title: new Text("Welcome"), backgroundColor: Colors.black),
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
      body: new SafeArea(
        child: new Column(
          children: [
            new Expanded(
              flex: 3,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(12.86, 17.90),
                  zoom: 15,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                myLocationEnabled: true,
              ),
            ),
            new Expanded(
              flex: 1,
              child: new Container(
                color: Colors.grey[300],
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // new RaisedButton(
                    //   child: new Text("Ride completed"),
                    //   textColor: Colors.white,
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(100)),
                    //   color: Colors.blueAccent[600],
                    //   onPressed: null,
                    // ),
                    new RaisedButton(
                        child: new Text("Start Ride"),
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.black,
                        onPressed: () {
                          openurl();
                          // _showNotificationWithoutSound();

                          //  Navigator.of(context).popAndPushNamed('/screen2');

                          // userLocation();
                          // showDriverLocation();
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
//   Future onSelectNotification(String payload) async {
//     showDialog(
//       context: context,
//       builder: (_) {
//         return new AlertDialog(
//           title: Text("PayLoad"),
//           content: Text("Payload : $payload"),
//         );
//       },
//     );
//   }
//   Future _showNotificationWithoutSound() async {
//   var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
//       'your channel id', 'your channel name', 'your channel description',
//       playSound: false, importance: Importance.Max, priority: Priority.High);
//   var iOSPlatformChannelSpecifics =
//       new IOSNotificationDetails(presentSound: false);
//   var platformChannelSpecifics = new NotificationDetails(
//       androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//   await flutterLocalNotificationsPlugin.show(
//     0,
//     'New Post',
//     'How to Show Notification in Flutter',
//     platformChannelSpecifics,
//     payload: 'No_Sound',
//   );
// }
}
