import 'package:flutter/material.dart';
import 'package:talabat/component/drawer.dart';
import 'package:talabat/component/header.dart';
/*
class Helps extends StatefulWidget {
  @override
  _HelpsState createState() => _HelpsState();
}

class _HelpsState extends State<Helps> {
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
              title: Text("مساعدة"),
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
            child: Container(width: 200, height: 200, child: Text(''))));
  }
}

*/

//import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home.dart';

class Helps extends StatefulWidget {
  @override
  _HelpsState createState() => _HelpsState();
}

class _HelpsState extends State<Helps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
        leading: Container(
            width: 220,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            )),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 50.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(59),
                  border: Border.all(color: Colors.grey.withOpacity(.3))),
              child: Container(
                padding: const EdgeInsets.only(left: 70),
                child: Text(
                  'المساعدة',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chat_bubble_outline,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            post('', 'assets/image/help.png', 'عنوان فرعي', 'مساعدة رقم١ ', 123,
                43),
            post('', 'assets/image/help.png', 'عنوان فرعي".', 'مساعدة رقم ٢  ',
                75, 23),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    decoration:
                        BoxDecoration(border: Border(bottom: BorderSide())),
                    child: Text(
                      'الطلبات',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  width: 12,
                ),
                Text(
                  'الدفع',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  'جديد التطبيق',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            FloatingActionButton(
              onPressed: null,
              backgroundColor: Colors.black,
              child: Text(
                'الاقسام',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          ],
        ),
      ),
    );
  }
}

Widget post(String image, user, title, name, int likes, comments) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        border: Border(
      bottom: BorderSide(color: Colors.grey.withOpacity(.5), width: .5),
    )),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(user),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '35 mins ago',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Text(
              title,
              style: TextStyle(color: Colors.black.withOpacity(.7)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
            child: image != ''
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(image))
                : Text('تفاصيل' +
                    '\n' +
                    'تفاصيل' +
                    '\n' +
                    'تفاصيل' +
                    '\n' +
                    'تفاصيل' +
                    '\n' +
                    'تفاصيل' +
                    '\n' +
                    'تفاصيل' +
                    '\n' +
                    'تفاصيل' +
                    '\n'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      FlatButton.icon(
                          onPressed: null,
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.redAccent,
                          ),
                          label: Text(
                            "$likes",
                            style: TextStyle(color: Colors.black),
                          )),
                      FlatButton.icon(
                          onPressed: null,
                          icon: Icon(
                            FontAwesomeIcons.comment,
                            color: Colors.black,
                          ),
                          label: Text(
                            "$comments",
                            style: TextStyle(color: Colors.black),
                          )),
                    ]),
                Icon(
                  Icons.share,
                  color: Colors.black,
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
