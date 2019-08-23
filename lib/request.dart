import 'dart:async';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'signin.dart';
import 'package:http/http.dart' as http;

final String url1 = "https://nec-hn.herokuapp.com/user";
final String url2 = "https://nec-hn.herokuapp.com/driver";

Future<dynamic> userLocation() async {
  String token = await signInWithGoogle();
  double latitude, longitude;

  Future<double> _premiumLatitude() async {
    Position position;

    try {
      position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
<<<<<<< HEAD
      
     
      // print(latitude);
      // print(longitude);
=======
>>>>>>> a6b31871edce1cc251aaeaebf24038464bb1c06c
    } on Exception {
      position = null;
    }
    return latitude;
  }

  double lat = await _premiumLatitude();
  Future<double> _premiumLongitude() async {
    Position position;

    try {
      position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
<<<<<<< HEAD
      
     
      // print(latitude);
      // print(longitude);
=======
      longitude = position.longitude;
>>>>>>> a6b31871edce1cc251aaeaebf24038464bb1c06c
    } on Exception {
      position = null;
    }
    return longitude;
  }

  double lon = await _premiumLongitude();
  print(token);
  print(lat);
  print(lon);

  var response = await http.post(Uri.encodeFull(url1),
<<<<<<< HEAD
      body: json.encode({"uid": id, "latitude": lat, "longitude": lon}),
=======
      body: json.encode({"token": token, "latitude": lat, "longitude": lon}),
>>>>>>> a6b31871edce1cc251aaeaebf24038464bb1c06c
      headers: {
        "content-type": "application/json",
        "Accept": "application/json"
      });
  print(response.body);
  final int statusCode = response.statusCode;
  if (statusCode == 201) {
    print("Please login again");
  }
}

/////////////////////////////////////////////

Future<dynamic> driverLocation() async {
  String token = await signInWithGoogle();
  double latitude, longitude;

  Future<double> _currentLatitude() async {
    Position position;

    try {
      position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
    } on Exception {
      position = null;
    }
    return latitude;
  }

  double lat = await _currentLatitude();
  Future<double> _currentLongitude() async {
    Position position;

    try {
      position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      

      // print(latitude);
      // print(longitude);
    } on Exception {
      position = null;
    }
    return longitude;
  }

  double lon = await _currentLongitude();
  print(token);
  print(lat);
  print(lon);

  var response = await http.post(Uri.encodeFull(url2),
<<<<<<< HEAD
      body: json
          .encode({"uid": id, "latitude": latitude, "longitude": longitude}),
=======
      body: json.encode({"token": token, "latitude": lat, "longitude": lon}),
>>>>>>> a6b31871edce1cc251aaeaebf24038464bb1c06c
      headers: {
        "content-type": "application/json",
        "Accept": "application/json"
      });
  print(response.body);
  final int statusCode = response.statusCode;
  if (statusCode == 201) {
    print("Please login again");
  }
}
