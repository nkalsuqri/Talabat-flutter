import 'package:flutter/material.dart';
import 'package:talabat/component/drawer.dart';
import 'package:talabat/component/header.dart';
import 'package:talabat/pages/home.dart';
/*
class Tickets extends StatefulWidget {
  @override
  _TicketsState createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
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
              title: Text("القسائم"),
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
                width: 200, height: 200, child: Text('لا توجد  قسائم'))));
  }
}

*/
//import 'package:flutter/material.dart';

class Tickets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  color: Colors.orange[500],
                  width: double.infinity,
                  height: 120,
                ),
                Positioned(
                  top: 36,
                  left: 12,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 32,
                        color: Colors.white,
                      )),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: height * 0.077),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.blue, width: 2)),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: <Widget>[
                                      Icon(Icons.star, color: Colors.blue),
                                      Text(
                                        'Rating',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                )),
                            Text('قيمنا'),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 1.3), blurRadius: 3.6)
                              ]),
                          child: ClipOval(
                              child: Image.asset(
                            'assets/image/discount-coupon.png',
                            width: 160,
                          )),
                        ),

                        //  child: Image.asset('assets/hossin.jpg',width: 120,)

                        Column(
                          children: <Widget>[
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.red, width: 2)),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Icon(
                                    Icons.mail,
                                    color: Colors.red,
                                    size: 48,
                                  ),
                                )),
                            Text('تواصل معنا'),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Center(
                child: Text(' القسائم',
                    style: TextStyle(
                        fontSize: 32, color: Colors.black.withOpacity(.6)))),
            SizedBox(
              height: 2,
            ),
            Center(
                child: Text(' Nasser Alsuqri',
                    style: TextStyle(fontSize: 18, color: Colors.grey))),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(' قسائمك',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black.withOpacity(.7),
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  card('الذهبية', '042355 -1/1/2021', Colors.orange[300]),
                  card('الفضية', '042355 -1/1/2021', Colors.grey[300]),
                  card('البرونزية', '042355 -1/1/2021', Colors.yellow[200]),
                  card('VPI', '042355 -1/1/2021', Colors.white),
                  card('دائم', '042355 -1/1/2021', Colors.blue[400]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget card(String title, desc, Color color) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 21),
    child: Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(offset: Offset(0, 1.3), blurRadius: 3.6)]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
            child: Image.asset(
              'assets/image/gift-voucher.png',
              width: 160,
            ),
          )),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(title,
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.black.withOpacity(.7),
                          fontWeight: FontWeight.bold)),
                  Text(desc,
                      style: TextStyle(
                          fontSize: 16, color: Colors.black.withOpacity(.7))),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
