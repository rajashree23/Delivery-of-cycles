import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nec/driver.dart';
import 'package:nec/idleDriver.dart';
import 'signin.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'FinalDetails.dart';
import 'driver.dart';
import 'idleDriver.dart';
// import 'driverLocationModel.dart';
// final String url1 = "https://nec-hn.herokuapp.com/user";
final String url2 = "https://nec-hn.herokuapp.com/driver";
// final String url3 = "https://nec-hn.herokuapp.com/driverlocation";

// Future<dynamic> userLocation() async {
//   String token = await signInWithGoogle();
//   double latitude, longitude;

//   Future<double> _premiumLatitude() async {
//     Position position;

//     try {
//       position = await Geolocator()
//           .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//       latitude = position.latitude;

      
     
//       // print(latitude);
//       // print(longitude);
//     } on Exception {
//       position = null;
//     }
//     return latitude;
//   }

//   double lat = await _premiumLatitude();
//   Future<double> _premiumLongitude() async {
//     Position position;

//     try {
//       position = await Geolocator()
//           .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//       longitude = position.longitude;
      
     
//       // print(latitude);
//       // print(longitude);
//     } on Exception {
//       position = null;
//     }
//     return longitude;
//   }

//   double lon = await _premiumLongitude();
//   print(token);
//   print(lat);
//   print(lon);

//   var response = await http.post(Uri.encodeFull(url1),

//       body: json.encode({"token": token, "lattitude": lat, "longitude": lon}),
//       headers: {
//         "content-type": "application/json",
//         "Accept": "application/json"
//       });
//   print(response.body);
//   final data = json.decode(response.body);

//         final responses = new DriverLocation.fromJson(data);
//         print(responses.lattitude);
//         print(responses.longitude);
 
// }

// /////////////////////////////////////////////

Future<dynamic> driverTime(BuildContext context) async {
   String token = await signInWithGoogle();
  double latitude, longitude;

  Future<double> _latitude() async {
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

  double lat = await _latitude();
  Future<double> _longitude() async {
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

  double lon = await _longitude();
  print(token);
  print(lat);
  print(lon);




 var now = new DateTime.now();
 String time1= new DateFormat("H").format(now);
 var time=int.parse(time1);

//  print(time);
//  print(now.weekday);
 var weekday=now.weekday;

 var response = await http.post(Uri.encodeFull(url2),

      body: json.encode({"token": token,"lattitude":lat, "longitude": lon,"day":weekday,"time":time,"holiday": 0 }),
      headers: {
        "content-type": "application/json",
        "Accept": "application/json"
      });
  print(response.body);
  
  final data = json.decode(response.body);

        final responses = new DriverLocation.fromJson(data);
        print(responses.fromplace);
        print(responses.toplace);
        print(responses.done);
        if(responses.done==0){
          return IdleDriver();
        }
       if(responses.done==1)
      {
         Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Driver()),);
      }
      if(responses.done==0)
      {
         Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => IdleDriver()),);
      }
    }
 





//     // Future<dynamic> showDriverLocation() async {
//     //   var response = await http.get(Uri.encodeFull(url1));
//     //     print(response);
//     //     final data = json.decode(response.body);

//       //   // print(response.body);
//       //    final responses = new DriverLocation.fromJson(data);
//       //   print(responses);

        
//       // } 
