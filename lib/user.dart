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

class User extends StatefulWidget {
  @override
  UserState createState() => UserState();
}

class UserState extends State<User> {
  Completer<GoogleMapController> _controller = Completer();
  double longitude, latitude;
   @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width; // Using this line I got the device screen width

    return new Scaffold(
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
      body: new SafeArea(//I didnt add appbar. this will add necessary padding for status bar.
        child: new Column(
        children: [
          new Expanded(
            flex: 3,
           
            
              child:  
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
             
                
              ),
           
          // ),
          new Expanded(
            flex: 2,
            child: RaisedButton(
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
                  }),//var // this will give you flexible width not fixed width
              // margin: margin, //variable
              // color: backColor,//variable
            ),
          
        ],
      ),
      ),
    );
  }

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
