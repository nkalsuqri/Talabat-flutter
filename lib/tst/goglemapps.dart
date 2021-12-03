import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:talabat/component/shared_data.dart';
import 'package:talabat/tst/mapingtest.dart';

class Googlemapp extends StatefulWidget {
  final double userlatitude;
  final double userlongitude;
  Googlemapp({this.userlatitude, this.userlongitude});

  @override
  _GooglemappState createState() => _GooglemappState();
}

var selectlatitude;
var selectlongitude;

class _GooglemappState extends State<Googlemapp> {
  List<Marker> allmarker = [
    Marker(
      markerId: MarkerId('my locations'),
      position: LatLng(userlatitude, userlongitude),
    )
  ];

  List<Marker> myMarker = [];
  List<Marker> myMarker1 = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    myMarker1.add(
      Marker(
        markerId: MarkerId('my Marker'),
        draggable: true,
        onTap: () {
          print('Marker Tap');
        },
        onDragEnd: (value) {
          selectlatitude = value.latitude;
          selectlongitude = value.longitude;
          ShareDataLocation(selectlatitude, selectlongitude);
          print(value.latitude.toString() +
              ' ----- ' +
              value.longitude.toString());
        },
        position: LatLng(userlatitude, userlongitude),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Column(
        children: [
          Container(
            child: Text(userlatitude.toString()),
            width: 100,
            height: 30,
          ),
          Container(
            height: 500,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                  //bearing: 192.8334901395799,
                  //target: LatLng(37.43296265331129, -122.08832357078792),
                  target: LatLng(userlatitude, userlongitude),
                  //tilt: 59.440717697143555,
                  zoom: 12.0),
              markers: Set.from(myMarker1),
              mapType: MapType.hybrid,
              //onTap: _handleTab,
            ),
          ),
        ],
      ),
    );
  }

  _handleTab(LatLng tappedPoint) {
    setState(() {
      myMarker = [];
      myMarker.add(
        Marker(
            markerId: MarkerId(tappedPoint.toString()),
            position: tappedPoint,
            draggable: true,
            onDragEnd: (dargEndPosition) {
              print(dargEndPosition);
            }),
      );
    });
  }
}
