import 'package:flutter/material.dart';
import 'package:talabat/component/drawer.dart';
import 'package:talabat/component/header.dart';

import 'home.dart';

//import 'package:flutter/material.dart';

class Foryou extends StatefulWidget {
  @override
  _ForyouState createState() => _ForyouState();
}

class _ForyouState extends State<Foryou> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xFFF0AA29),
        Color(0xFFF5620C),
      ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('اخترنا لكم - مطاعم -'),
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              icon: Icon(Icons.arrow_back_ios)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                restorant(),
                restorant(),
                restorant(),
                restorant(),
                restorant(),
                restorant(),
                restorant(),
                restorant(),
                restorant(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget restorant() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.amber.withOpacity(.1),
            border: Border(
                bottom: BorderSide(color: Colors.orange.withOpacity(.25)))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListTile(
            leading: Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset(
                    'assets/image/food-tray.png',
                    width: 70,
                  )),
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "مطعم دليلي",
                      style: TextStyle(color: Color(0xFF19769F), fontSize: 18),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.near_me,
                          color: Colors.grey,
                        ),
                        Text(
                          "0.7 km",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                ),
                Text(
                  "  محافظة مسقط - ولايةالسيب",
                  style: TextStyle(color: Colors.grey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Color(0xFF19769F),
                          size: 20,
                        ),
                        Text(
                          'المعبيلة الجنوبية',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black.withOpacity(.6)),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star_border,
                          color: Colors.blue,
                        ),
                        Text(
                          ' 4.5',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
