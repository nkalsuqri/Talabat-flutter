import 'package:flutter/material.dart';
import 'package:talabat/component/drawer.dart';
import 'package:talabat/component/footer.dart';
import 'package:talabat/component/header.dart';

class Alerts extends StatefulWidget {
  @override
  _AlertsState createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
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
              title: Text("الاشعارات"),
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
                width: 200, height: 200, child: Text('لا توجد  اشعارات'))));
  }
}
