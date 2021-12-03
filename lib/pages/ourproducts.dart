import 'package:flutter/material.dart';
import 'package:talabat/component/drawer.dart';

class OurProducts extends StatefulWidget {
  @override
  _OurProductsState createState() => _OurProductsState();
}

class _OurProductsState extends State<OurProducts> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                backgroundColor: Colors.orange[500],
                title: Text("Our Products"),
                actions: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {},
                  ),
                ],
              ),
              Header(),
              Caregories(),
              ListItems(),
              ListItemsv(),
            ],
          ),
          extendBody: true, //شفافية خلف لفلووووت
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
          drawer: MyDrawer(),
        ));
  }
}

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverList(
        delegate: SliverChildListDelegate([
      Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: size.height / 5,
                decoration: BoxDecoration(
                    color: Colors.orange[500],
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(45)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10, offset: Offset(1, 1), spreadRadius: 1)
                    ]),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 50,
                            backgroundImage:
                                AssetImage('assets/image/public1.jpg')),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          children: [
                            Text(
                              'Company Name',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                ' Company Parpase',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          ' 12 OMR ',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(right: 50, left: 50),
              height: 50,
              width: size.width - 100,
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(right: 5, left: 5),
                      labelText: 'Search about ......',
                      suffixIcon: Icon(Icons.search)),
                ),
              ),
            ),
          ),
        ],
      )
    ]));
  }
}

class Caregories extends StatefulWidget {
  @override
  _CaregoriesState createState() => _CaregoriesState();
}

int selectItems = 0;

class _CaregoriesState extends State<Caregories> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 100,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, i) {
              return Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        margin:
                            EdgeInsets.only(left: i == 0 ? 20 : 0, right: 20),
                        child: GestureDetector(
                          child: Card(
                            color: selectItems == i
                                ? Colors.orange[50]
                                : Colors.white,
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Icon(
                              Icons.fastfood,
                              size: 35,
                              color: selectItems == i
                                  ? Colors.black
                                  : Colors.orange,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              selectItems = i;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        width: 90,
                        margin: EdgeInsets.only(
                          left: i == 0 ? 20 : 0,
                          right: 20,
                        ),
                        child: Row(
                          children: [
                            Spacer(),
                            Text('namesssss'),
                            Spacer(),
                          ],
                        ),
                      )),
                ],
              );
            }),
      ),
    );
  }
}

class ListItems extends StatefulWidget {
  @override
  _ListItemsState createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        height: 240,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, i) {
              return Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      right: i == 0 ? 20 : 0,
                      left: 20,
                    ),
                    height: 240,
                    width: 200,
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(40),
                      )),
                      child: Column(
                        children: [
                          Text("Item " + (i + 1).toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {},
                                ),
                              ),
                              Spacer(),
                              Text(
                                '11.00 OMR',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 50,
                      left: 0,
                      child: Container(
                        height: 120,
                        child: Image.asset('assets/image/public3.jpg'),
                      ))
                ],
              );
            }),
      ),
    );
  }
}

class ListItemsv extends StatefulWidget {
  @override
  _ListItemsvState createState() => _ListItemsvState();
}

class _ListItemsvState extends State<ListItemsv> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    int selectItems = 0;
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.all(20),
        width: size.width - 100,
        height: 340,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, i) {
              return Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 200,
                    width: size.width - 100,
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.orange[500], width: 1),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(40),
                          topLeft: Radius.circular(40),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: size.width,
                            alignment: Alignment.center,
                            height: 100,
                            child: Image.asset('assets/image/public2.jpg'),
                          ),
                          Text("Item " + (i + 1).toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 20),
                                child: Text(
                                  '11.00 OMR',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Spacer(),
                              Container(
                                margin: EdgeInsets.only(left: 15, bottom: 5),
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
