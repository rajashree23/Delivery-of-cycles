import 'dart:async';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'signin.dart';
import 'package:http/http.dart' as http;
import 'driverLocationModel.dart';
final String url1 = "https://nec-hn.herokuapp.com/user";
final String url2 = "https://nec-hn.herokuapp.com/driver";
final String url3 = "https://nec-hn.herokuapp.com/driverlocation";

Future<dynamic> userLocation() async {
  String token = await signInWithGoogle();
  double latitude, longitude;

  Future<double> _premiumLatitude() async {
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
    return latitude;
  }

  double lat = await _premiumLatitude();
  Future<double> _premiumLongitude() async {
    Position position;

    try {
      position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      longitude = position.longitude;
      
     
      // print(latitude);
      // print(longitude);
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
      body: json.encode({"token": token, "lattitude": lat, "longitude": lon}),
      headers: {
        "content-type": "application/json",
        "Accept": "application/json"
      });
  print(response.body);
  final data = json.decode(response.body);

         final responses = new DriverLocation.fromJson(data);
        print(responses.lattitude);
        print(responses.longitude);
 
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
      longitude = position.longitude;
      

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
      body: json.encode({"token": token, "lattitude": lat, "longitude": lon}),
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




    // Future<dynamic> showDriverLocation() async {
    //   var response = await http.get(Uri.encodeFull(url1));
    //     print(response);
    //     final data = json.decode(response.body);

      //   // print(response.body);
      //    final responses = new DriverLocation.fromJson(data);
      //   print(responses);

        
      // } 
