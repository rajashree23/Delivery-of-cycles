import 'dart:async';
import 'package:geolocator/geolocator.dart';
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

  @override
  Widget build(BuildContext context) {
    void _currentLocation() async {
      final GoogleMapController controller = await _controller.future;
      Position position;

      try {
        position = await Geolocator()
            .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        latitude = position.latitude;
        longitude = position.longitude;

        // print(latitude);
        // print(longitude);
      } on Exception {
        position = null;
      }

      // controller.animateCamera(CameraUpdate.newCameraPosition(
      //   CameraPosition(
      //     bearing: 0,
      //     target: LatLng(position.latitude, position.longitude),
      //     zoom: 17.0,
      //   ),
      // ));
  }

    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(latitude, longitude),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        myLocationEnabled: true,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _currentLocation();
      //   },
      //   child: Icon(Icons.location_on),
      //   // label: Text('Get Location!'),
      //   // icon: Icon(Icons.location_on),
      // ),
      appBar: new AppBar(title: new Text("Welcome")),
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
//   void _currentLocation() async {
//     final GoogleMapController controller = await _controller.future;
//     Position position;

//     try {
//       position = await Geolocator()
//           .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//       latitude = position.latitude;
//       longitude = position.longitude;

//       // print(latitude);
//       // print(longitude);
//     } on Exception {
//       position = null;
//     }

//     controller.animateCamera(CameraUpdate.newCameraPosition(
//       CameraPosition(
//         bearing: 0,
//         target: LatLng(position.latitude, position.longitude),
//         zoom: 17.0,
//       ),
//     ));
//   }
// }
