import 'dart:async';

import 'signin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// final String url1="https://nec-hn.herokuapp.com/user/tokenid";
// final String url2="https://nec-hn.herokuapp.com/driver/tokenid";
final String url1="https://nec-hn.herokuapp.com/user/tokenid/location";
final String url2="https://nec-hn.herokuapp.com/driver/tokenid/location";


Future<dynamic> userLocation() async {
       Future<String> id= signInWithGoogle();
    var response = await http.post(Uri.encodeFull(url1),
      body: json.encode({"token": id ,"latitude":23.43, "longitude":23.4}),
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


Future<dynamic> driverLocation() async {
       Future<String> id= signInWithGoogle();
    var response = await http.post(Uri.encodeFull(url1),
      body: json.encode({"token": id ,"latitude":23.43, "longitude":23.4}),
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
