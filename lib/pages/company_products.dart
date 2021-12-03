import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

double selectlatitude;
double selectlongitude;
var forBuildDetailProducts = 0;

class CompanyProducts extends StatefulWidget {
  @override
  _CompanyProductsState createState() => _CompanyProductsState();
}

List ourProducts = ['sdsads', 'asdasdewwef', 'ewergretert', 'afdsgg'];
List detailProducts = [
  {'name': 'كنافة', 'price': '١٢٠٠ ', 'picture': 'assets/image/offer4.jpg'},
  {'name': '1كنافة', 'price': '١٢٠٠ ', 'picture': 'assets/image/offer2.jpg'},
  {'name': '2كنافة', 'price': '١٢٠٠ ', 'picture': 'assets/image/offer3.jpg'},
  {'name': '3كنافة', 'price': '١٢٠٠ ', 'picture': 'assets/image/offer4.jpg'},
];

class _CompanyProductsState extends State<CompanyProducts> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlocation();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Title'),
          ),
          body: ListView(
            children: [
              Container(
                  //height: 150,
                  margin: EdgeInsets.only(
                    top: 0,
                  ),
                  padding: EdgeInsets.all(20),
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/image/offer4.jpg"),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.orange[500],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ],
                  )),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(' معلومات !!!',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold)),
                    Text('مايكرو أن',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Text('متخصصون في بيع المأكولات العربية والمشاوى وغيرها ...',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Icon(Icons.face, size: 25, color: Colors.orange),
                        Container(
                          width: 10,
                        ),
                        Text('التقييم جيد جدا من ٢٠٣٤٠٠٩',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.motorcycle_outlined,
                      size: 25,
                      color: Colors.orange,
                    ),
                    Container(
                      width: 10,
                    ),
                    Text('خلال ٤٥ دقيقة ',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Container(
                      width: 10,
                    ),
                    Text(' 3.000 ر.ع',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Container(
                padding: EdgeInsets.only(right: 0),
                width: MediaQuery.of(context).size.width,
                height: 60,
                margin: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.menu,
                        size: 35,
                        color: Colors.orange,
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: ListView.builder(
                        itemCount: ourProducts.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                            child: Container(
                              /*decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.orange, width: 2))),*/
                              width: 100.0,
                              child: Text(
                                ourProducts[i],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                              alignment: Alignment.center,
                            ),
                            onTap: () {
                              ForBuildDetailProductsfun(i);
                            },
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              forBuildDetailProducts == 0
                  ? BuildDetailProducts(context, 0)
                  : forBuildDetailProducts == 1
                      ? BuildDetailProducts(context, 1)
                      : forBuildDetailProducts == 2
                          ? BuildDetailProducts(context, 2)
                          : forBuildDetailProducts == 3
                              ? BuildDetailProducts(context, 3)
                              : Divider(
                                  color: Colors.grey,
                                ),
              Container(
                child: Text(selectlatitude.toString() +
                    '\n' +
                    selectlongitude.toString()),
              ),
            ],
          ),
        ));
  }

  ForBuildDetailProductsfun(var i) {
    setState(() {
      forBuildDetailProducts = i;
    });
  }

//الحصول على بيانات الموقع من الذاكرة
  getlocation() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      selectlatitude = preferences.getDouble("userLatLng");
      selectlongitude = preferences.getDouble("userlongitude");
      if (selectlatitude != null || selectlatitude != '') {
        setState(() {
          selectlatitude = preferences.getDouble("userLatLng");
          selectlongitude = preferences.getDouble("userlongitude");
        });
      }
    } catch (e) {
      print('مشكلة الحصول على الموقع المخزن');
    }
  }

  BuildDetailProducts(BuildContext context, var i) {
    //print(i);
    print(detailProducts.length);
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 300,
        child: ListView.builder(
            shrinkWrap: false,
            itemCount: detailProducts.length,
            itemBuilder: (context, i) {
              return Container(
                  margin: EdgeInsets.only(right: 20, left: 20, top: 5),
                  child: Container(
                    child: Card(
                      child: Container(
                          margin: EdgeInsets.only(
                              right: 20, left: 20, top: 5, bottom: 5),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      detailProducts[i]['name'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange),
                                    ),
                                    Text(detailProducts[i]['price'],
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey)),
                                  ],
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Image(
                                      image: AssetImage(
                                          detailProducts[i]['picture']),
                                      height: 60,
                                    ),
                                  ))
                            ],
                          )),
                    ),
                  ));
            }));
  }
}
