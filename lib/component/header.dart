import 'package:flutter/material.dart';

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
                          ' Demo  ',
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
