import 'dart:async';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';
import 'autocomplete.dart';
// import 'package:sign_in_flutter/loginpage.dart';
// import 'package:sign_in_flutter/signin.dart';
// import 'loginpage.dart';
import 'loginpage.dart';
import 'signin.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const kGoogleApiKey = "AIzaSyAAsdT4ypXdy_0tOrE5NMl-pess_Eo07D0";

GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class FirstScreen extends StatefulWidget {
  @override
  FirstScreenState createState() => FirstScreenState();
}

class FirstScreenState extends State<FirstScreen> {
  Completer<GoogleMapController> _controller = Completer();
  double longitude, latitude;

  @override
  Widget build(BuildContext context) {
    // void _currentLocation() async {
    //   final GoogleMapController controller = await _controller.future;
    //   Position position;

    //   try {
    //     position = await Geolocator()
    //         .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    //     latitude = position.latitude;
    //     longitude = position.longitude;

    //     // print(latitude);
    //     // print(longitude);
    //   } on Exception {
    //     position = null;
    //   }

    // controller.animateCamera(CameraUpdate.newCameraPosition(
    //   CameraPosition(
    //     bearing: 0,
    //     target: LatLng(position.latitude, position.longitude),
    //     zoom: 17.0,
    //   ),
    // ));

    return Scaffold(
       appBar: new AppBar(
          title: new Text("Welcome"), backgroundColor: Colors.purple[800]),

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
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
                    color: Colors.purple),
              ),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage('assets/face.png'),
                  fit: BoxFit.cover,
                ),
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
      body:new Container(
        child: new Column(
          children: <Widget>[
            GoogleMap(
                mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(12.86, 17.90),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        myLocationEnabled: true,
      ),
       new Container(
         child: new Column(children: <Widget>[
           new RaisedButton(
             child: const Text('From where'),
         color: Colors.grey,
         elevation: 4.0,
         splashColor: Colors.blueGrey,
         onPressed: () async {
        // show input autocomplete with selected mode
        // then get the Prediction selected
        Prediction p = await PlacesAutocomplete.show(
            context: context, apiKey: kGoogleApiKey);
        displayPrediction(p);

       }
           )
         ],),
       )
            
          ],
        
        )
      )

      

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _currentLocation();
      //    Navigator.push(context, MaterialPageRoute(builder: (context) => Demo()));
      //   },

      //   child: Icon(Icons.location_on),
      //   // label: Text('Get Location!'),
      //   // icon: Icon(Icons.location_on),
      // ),
      

      //      onPressed: () async {
      //   // show input autocomplete with selected mode
      //   // then get the Prediction selected
      //   Prediction p = await PlacesAutocomplete.show(
      //       context: context, apiKey: kGoogleApiKey);
      //   displayPrediction(p);

      // },

      // color: Colors.grey,
      // child: Padding(
      //   padding: const EdgeInsets.all(8.0),
      // //   child: Text(
      // //     'Sign Out',
      // //     style: TextStyle(fontSize: 25, color: Colors.white),
      // //   ),
      // // ),
      //   // elevation: 5,
      //   shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(40)),
      // ),

      // body: Container(
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment.topRight,
      //       end: Alignment.bottomLeft,
      //       colors: [Colors.blue[100], Colors.blue[400]],
      //     ),
      //  drawer: new Drawer(
      //     child: new ListView(
      //       children: <Widget>[
      //         new UserAccountsDrawerHeader(

      // drawer: new Drawer(
      //   child: new ListView(
      //     children: <Widget>[
      //       new UserAccountsDrawerHeader(
      //         accountName: new Text(
      //           name,
      //           style: TextStyle(
      //               fontSize: 25,
      //               color: Colors.deepPurple,
      //               fontWeight: FontWeight.bold),
      //         ),
      //         accountEmail: new Text(
      //           email,
      //           style: TextStyle(
      //               fontSize: 15,
      //               fontWeight: FontWeight.bold,
      //               color: Colors.purple),
      //         ),
      //         decoration: new BoxDecoration(
      //           image: new DecorationImage(
      //             image: new ExactAssetImage('assets/face.png'),
      //             fit: BoxFit.cover,
      //           ),
      //         ),
      //         currentAccountPicture:
      //             CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
      //       ),
      //       new ListTile(
      //           leading: Icon(Icons.directions_bike),
      //           title: new Text("Your rides"),
      //           onTap: () {
      //             Navigator.pop(context);
      //           }),
      //       new ListTile(
      //           leading: Icon(Icons.payment),
      //           title: new Text("Payment"),
      //           onTap: () {
      //             Navigator.pop(context);
      //           }),
      //       new ListTile(
      //           leading: Icon(Icons.help),
      //           title: new Text("Help"),
      //           onTap: () {
      //             Navigator.pop(context);
      //           }),
      //       new ListTile(
      //           leading: Icon(Icons.settings),
      //           title: new Text("Settings"),
      //           onTap: () {
      //             Navigator.pop(context);
      //           }),
      //       new ListTile(
      //           leading: Icon(Icons.power_settings_new),
      //           title: new Text("Logout"),
      //           onTap: () {
      //             signOutGoogle();
      //             Navigator.of(context).pushAndRemoveUntil(
      //                 MaterialPageRoute(builder: (context) {
      //               return LoginPage();
      //             }), ModalRoute.withName('/'));
      //           }),
      //     ],
      //   ),
      // ),
      // RaisedButton(
      //    child: const Text('From where'),
      //    color: Colors.grey,
      //    elevation: 4.0,
      //    splashColor: Colors.blueGrey,
      //    onPressed: () async {
      //   // show input autocomplete with selected mode
      //   // then get the Prediction selected
      //   Prediction p = await PlacesAutocomplete.show(
      //       context: context, apiKey: kGoogleApiKey);
      //   displayPrediction(p);

      //  }),

      //                 Text(
      //   email,
      //   style: TextStyle(
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
      //       fontSize: 25,
      //       color: Colors.deepPurple,
      //       fontWeight: FontWeight.bold),
      // ),
      // SizedBox(height: 40),

      // RaisedButton(
      //   onPressed: () {

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
    );
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
  Future<Null> displayPrediction(Prediction p) async {
    if (p != null) {
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId);

      var placeId = p.placeId;
      double lat = detail.result.geometry.location.lat;
      double lng = detail.result.geometry.location.lng;

      var address = await Geocoder.local.findAddressesFromQuery(p.description);
      print(address);
      print(lat);
      print(lng);
    }
  }
}
