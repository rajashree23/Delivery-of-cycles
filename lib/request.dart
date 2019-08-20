import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'signin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'signin.dart';
// final String url1="https://nec-hn.herokuapp.com/user/tokenid";
// final String url2="https://nec-hn.herokuapp.com/driver/tokenid";
final String url1="https://nec-hn.herokuapp.com/user/tokenid/location";
final String url2="https://nec-hn.herokuapp.com/driver/tokenid/location";


Future<dynamic> signin() async {
       Future<String> id= signInWithGoogle();
    var response = await http.post(Uri.encodeFull(url1),
      body: json.encode({"token": id ,"latitude":10.12, "longitude":20.78}),
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