import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talabat/tst/mapingtest.dart';
import 'package:geolocator/geolocator.dart';

ShareDataSave(String name, String email) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString("username", name);
  preferences.setString("email", email);
  //print(preferences.getString("email"));
}

ShareDataRemove() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.remove("username");
  preferences.remove("email");
}

var username;
var email;
bool isSingIn = false;
ShareDataGet() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  username = preferences.getString("username");
  email = preferences.getString("email");
  //print("emailoooo = " + username);
  return username;
}

ShareDataLocation(double userLatLng, double userlongitude) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  print('userLatLng=>' + userLatLng.toString());

  preferences.setDouble("userLatLng", userLatLng);
  preferences.setDouble("userlongitude", userlongitude);
  //print(preferences.getString("email"));
}

ShareDataRemoveLocation() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.remove("userLatLng");
  preferences.remove("userlongitude");
}
