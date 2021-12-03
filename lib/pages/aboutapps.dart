import 'package:flutter/material.dart';
import 'package:talabat/component/drawer.dart';
import 'package:talabat/component/header.dart';
/*
class AboutApp extends StatefulWidget {
  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
/*
          appBar: AppBar(
            title: Text('العروض'),
          ),
          */
        drawer: MyDrawer(),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text("عن التطبيق"),
              pinned: true,
              backgroundColor: Colors.orange[500],
              actions: [
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {},
                ),
              ],
            ),
            Header(),
            sss(),
          ],
        ),
        //-------------------footer--------------

        extendBody: true, //شفافية خلف لفلووووت
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed: () {},
          child: Icon(Icons.home),
        ),
        bottomNavigationBar: ClipRRect(
          //عشان الحواف الدائرية للفوتر
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          child: Container(
            color: Colors.black26, //ظل خلف لفلوووووت
            child: BottomAppBar(
              shape: CircularNotchedRectangle(),
              color: Colors.orange,
              child: Row(
                children: [
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.add_alert)),
                  Spacer(),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.turned_in)),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),

        //-------------------endfooter------------
      ),
    );
  }

  sss() {
    return SliverToBoxAdapter(
        child: Container(
            margin: EdgeInsets.all(20),
            width: 100,
            height: 340,
            child: Container(
                width: 200,
                height: 200,
                child: Text('تطبيق تجريبي يشابه تطبيق طلبات '))));
  }
}
*/

import 'package:flutter/cupertino.dart';

import 'home.dart';
//import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.orange,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.teal,
                    backgroundImage:
                        AssetImage('assets/image/talabat-logo.png'),
                  ),
                  Text(
                    'خاص لشركة دليلي',
                    style: TextStyle(
                      fontFamily: 'Nasser Alsuqri',
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'NASSER ALSUQRI',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      color: Colors.teal.shade100,
                      fontSize: 20,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'FLUTTER DEVELOPER',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      color: Colors.teal.shade100,
                      fontSize: 20,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      title: Text(
                        '0096895345705',
                        style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          color: Colors.teal.shade900,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: ListTile(
                      leading: Icon(
                        Icons.mail,
                        color: Colors.teal,
                      ),
                      title: Text(
                        'nkalsuqri@gmail.com',
                        style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          color: Colors.teal.shade900,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Card(
                      color: Colors.white,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: ListTile(
                        leading: Icon(
                          Icons.close,
                          color: Colors.teal,
                        ),
                        title: Text(
                          'close..',
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            color: Colors.teal.shade900,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
