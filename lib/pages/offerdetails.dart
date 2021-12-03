import 'package:flutter/material.dart';
import 'package:talabat/component/drawer.dart';
import 'package:talabat/component/shared_data.dart';
import 'package:talabat/tst/goglemapps.dart';

import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

var userlatitude;
var userlongitude;

class OfferDetails extends StatefulWidget {
  final int offerid;
  final String offertitle;
  final String offersubtitle;
  final String offerimage;
  final String offercompany;
  OfferDetails(
      {this.offerid,
      this.offertitle,
      this.offersubtitle,
      this.offerimage,
      this.offercompany});

  @override
  _OfferDetailsState createState() => _OfferDetailsState();
}

class _OfferDetailsState extends State<OfferDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print("jjjjjj");
    getlocation();
    getGeolocator();
    //ShareDataRemoveLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Offer Details'),
        ),
        drawer: MyDrawer(),
        body: Center(
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey[500], width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image(
                  image: AssetImage('assets/image/' + widget.offerimage),
                  height: 50,
                  width: 50,
                ),
              ),
              Text(
                "ابدء طلبك معنا أون لاين من",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                widget.offercompany,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              InkWell(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on_outlined, size: 30),
                      Container(
                          padding: EdgeInsets.only(right: 20, left: 10),
                          child: Text(
                            "حدد موقع التوصيل" +
                                '\n' +
                                selectlatitude.toString() +
                                '\n' +
                                selectlongitude.toString(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                      Icon(Icons.arrow_drop_down_outlined, size: 40),
                    ],
                  ),
                ),
                onTap: () {
                  //print(userlongitude);
                  // Navigator.of(context).pushNamed('googlemap');

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Googlemapp(
                                userlatitude: userlatitude,
                                userlongitude: userlongitude,
                              )));
                },
              ),
              Center(
                child: IconButton(
                  icon: Icon(Icons.refresh_outlined),
                  onPressed: () {
                    getlocation();
                  },
                ),
              ),
              colectLocation
                  ? gotoOffetrIcon(context)
                  : havelocation
                      ? gotoOffetrIcon(context)
                      : Container(),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector gotoOffetrIcon(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: 30, top: 20, right: 30, bottom: 50),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.orange[500],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text('العرض',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      onTap: () {
        Navigator.of(context).pushNamed('companyProducts');
      },
    );
  }

  bool havelocation = false;
  var selectlatitude;
  var selectlongitude;
  getlocation() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      selectlatitude = preferences.getDouble("userLatLng");
      selectlongitude = preferences.getDouble("userlongitude");
      if (selectlatitude != null || selectlatitude != '') {
        setState(() {
          selectlatitude = preferences.getDouble("userLatLng");
          selectlongitude = preferences.getDouble("userlongitude");
          havelocation = true;
        });
      }
    } catch (e) {
      havelocation = false;
      print('مشكلة الحصول على الموقع المخزن');
    }
  }

  bool colectLocation = false;
  getGeolocator() async {
    try {
      bool isLocationServiceEnabled =
          await Geolocator.isLocationServiceEnabled();
      //print(isLocationServiceEnabled);

      Position position = await Geolocator.getLastKnownPosition();
      //print(position);
      Position position1 = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        userlatitude = position1.latitude;
        userlongitude = position1.longitude;
        colectLocation = true;
      });
      //print(colectLocation.toString());
    } catch (e) {
      print('مشكلة الحصول على الموقع الحالي');
    }
  }
}
