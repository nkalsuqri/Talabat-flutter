import 'package:flutter/material.dart';
import 'package:talabat/pages/aboutapps.dart';
import 'package:talabat/pages/alert.dart';
import 'package:talabat/pages/company_products.dart';
import 'package:talabat/pages/foryou.dart';
import 'package:talabat/pages/helps.dart';
import 'package:talabat/pages/home.dart';
import 'package:talabat/pages/offers.dart';
import 'package:talabat/pages/ourproducts.dart';
import 'package:talabat/pages/reorders.dart';
import 'package:talabat/pages/tickets.dart';
import 'package:talabat/tst/goglemapps.dart';
import 'package:talabat/tst/mapingtest.dart';
import 'package:talabat/pages/reorders.dart';

void main() => runApp(TalabatApp());

class TalabatApp extends StatelessWidget {
  const TalabatApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Talabat App",
      theme: ThemeData(fontFamily: 'Cairo'),
      home: Home(),
      routes: {
        'home': (context) {
          return Home();
        },
        'maping': (context) {
          return MapingTest();
        },
        'googlemap': (context) {
          return Googlemapp();
        },
        'offers': (context) {
          return Offers();
        },
        'companyProducts': (context) {
          return CompanyProducts();
        },
        'ourproducts': (context) {
          return OurProducts();
        },
        'reorders': (context) {
          return Reorders();
        },
        'alerts': (context) {
          return Alerts();
        },
        'tickets': (context) {
          return Tickets();
        },
        'helps': (context) {
          return Helps();
        },
        'aboutapp': (context) {
          return AboutApp();
        },
        'foryou': (context) {
          return Foryou();
        },
      },
    );
  }
}
