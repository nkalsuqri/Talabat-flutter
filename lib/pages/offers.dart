import 'package:flutter/material.dart';
import 'package:talabat/component/drawer.dart';
import 'package:talabat/pages/offerdetails.dart';

class Offers extends StatefulWidget {
  Offers({Key key}) : super(key: key);

  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
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
                  title: Text("العروض"),
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
                Products(),
              ],
            )));
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

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List offerlist = [
    {
      'title': 'get 20% offer for coctale offer',
      'subtitle': 'this offer till to 06/2021 ',
      'company': 'Company name',
      'image': 'offer4.jpg'
    },
    {
      'title': 'get 20% offer for coctale offer',
      'subtitle': 'this offer till to 06/2021 ',
      'company': 'Company name',
      'image': 'offer4.jpg'
    },
    {
      'title': 'get 20% offer for coctale offer',
      'subtitle': 'this offer till to 06/2021 ',
      'company': 'Company name',
      'image': 'offer4.jpg'
    },
    {
      'title': 'get 20% offer for coctale offer',
      'subtitle': 'this offer till to 06/2021 ',
      'company': 'Company name',
      'image': 'offer4.jpg'
    },
    {
      'title': 'get 20% offer for coctale offer',
      'subtitle': 'this offer till to 06/2021 ',
      'company': 'Company name',
      'image': 'offer4.jpg'
    },
    {
      'title': 'get 20% offer for coctale offer',
      'subtitle': 'this offer till to 06/2021 ',
      'company': 'Company name',
      'image': 'offer4.jpg'
    },
  ];
  var listtilecolor;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: offerlist.length,
            itemBuilder: (context, i) {
              if (i % 2 == 0) {
                listtilecolor = Colors.orange[200];
              } else {
                listtilecolor = Colors.orange[100];
              }
              return ListTile(
                isThreeLine: true,
                tileColor: listtilecolor,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey[500], width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image(
                    image: AssetImage('assets/image/' + offerlist[i]['image']),
                    height: 50,
                    width: 50,
                  ),
                ),
                title: Text(i.toString() + ' ' + offerlist[i]['title']),
                subtitle: Text(
                    offerlist[i]['subtitle'] + '\n' + offerlist[i]['company']),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OfferDetails(
                                offerid: i,
                                offertitle: offerlist[0]['title'],
                                offersubtitle: offerlist[0]['subtitle'],
                                offerimage: offerlist[0]['image'],
                                offercompany: offerlist[0]['company'],
                              )));
                  //print(offerlist[0]['image']);
                },
              );
            }),
      ),
    );
  }
}
