import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:talabat/component/drawer.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:talabat/tst/goglemapps.dart';

class MapingTest extends StatefulWidget {
  MapingTest({Key key}) : super(key: key);

  @override
  _MapingTestState createState() => _MapingTestState();
}

var someVal;
var userlatitude;
var userlongitude;

@override
class _MapingTestState extends State<MapingTest> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Text('Google Map'),
          ),
          drawer: MyDrawer(),
          body: Container(
              child: Column(
            children: [
              GestureDetector(
                child: Text("data"),
                onTap: () {
                  print(userlatitude.toString());
                  print(userlongitude.toString());
                },
              ),
              IconButton(
                  onPressed: () async {
                    /*

                    Location location = new Location();

                    bool _serviceEnabled;
                    PermissionStatus _permissionGranted;
                    LocationData _locationData;
                    //_serviceEnabled = await location.serviceEnabled();
                    _locationData = await location.getLocation();
                    print(_locationData);*/
                  },
                  icon: Icon(Icons.add)),
              IconButton(
                icon: Icon(Icons.maps_home_work),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Googlemapp(
                                userlatitude: userlatitude,
                                userlongitude: userlongitude,
                              )));
                },
              ),
            ],
          )),
        ));
  }

  UserLocation() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    //print(isLocationServiceEnabled);

    Position position = await Geolocator.getLastKnownPosition();
    //print(position);
    Position position1 = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    userlatitude = position1.latitude;
    userlongitude = position1.longitude;
    //print(userlatitude);
    //print(userlongitude);
  }
}
