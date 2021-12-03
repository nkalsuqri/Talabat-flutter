import 'package:flutter/material.dart';
import 'package:talabat/component/drawer.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:talabat/component/shared_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

bool isreg = false;
bool isclosed = false;

class _HomeState extends State<Home> {
  String username = '';
  String email = '';

  //-------- method check login or not and put isreg = true or false
  isregisted() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      username = preferences.getString("username");
      email = preferences.getString("email");
      if (username != null || username != '') {
        setState(() {
          username = preferences.getString("username");
          email = preferences.getString("email");
          isreg = true;
        });
      }
    } catch (e) {
      isreg = false;
    }
  }

//------------- method check to close box1 and put sclosed = true or fulse
  void Closed() {
    setState(() {
      isclosed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    //ShareDataSave('aweeeeeee', 'wweewewew@.com'); // call function to save data
    ShareDataRemove(); // call function to remove data
    //isregisted(); // call method to check and get data
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: Colors.orange[500],
            //automaticallyImplyLeading: false,
            title: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(
                "التوصيل الى ........",
                style: TextStyle(fontSize: 16),
              ),
              InkWell(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "اختر الموقع",
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_drop_down_circle,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: null,
                    ),
                  ],
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return showDialogs();
                      });
                },
              )
            ]),
            centerTitle: true,
            titleSpacing: 20,
            //elevation: 50,
            //brightness: Brightness.light,
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          ),
        ),
        drawer: MyDrawer(),
//-------------------body ---------------------------
        body: ListView(
          children: [
            //top: -10,
            !isclosed
                ? block_num_1(context)
                : Container(), //build just if isclosed==false

            !isreg
                ? bock_register(context)
                : Container(), //build just if isreg==false
//----------start public order
            Container(
              padding: EdgeInsets.only(right: 20),
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: Text(
                "الأكثر طلبا",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            Container(
                padding: EdgeInsets.only(right: 0),
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  block_num_2(context, 'الطازج', 'لحوم وخظروات فواكه',
                      'assets/image/public1.jpg'),
                  block_num_2(context, 'فواكه', 'الذ الخضروات والفواكه',
                      'assets/image/public2.jpg'),
                  block_num_2(
                      context,
                      'من المزرعة',
                      'اجود انواع الفواكه والخضروات الطازجة',
                      'assets/image/public3.jpg'),
                  block_num_2(context, 'مطعمنا', 'كل طلباتك نلبيها',
                      'assets/image/public4.jpg'),
                  block_num_2(
                      context,
                      'الشامي',
                      '  مشاوي شامية -عراقية - تركية',
                      'assets/image/public5.jpg'),
                ])),

            Divider(),
//----------end public order
// ---------start slider offer-------------
            Container(
              padding: EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 300.0,
                width: MediaQuery.of(context).size.width,
                child: buildCarousel(),
              ),
            ),
            Divider(),
// ---------end slider offer-------------
//-----------start  bock offer from 30% to 50%
            Container(
              padding: EdgeInsets.only(right: 20),
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: Text(
                " تخفيظات من ٣٠ - ٥٠",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                padding: EdgeInsets.only(right: 0),
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  for (var i = 0; i < 5; i++)
                    block_num_2(context, 'الطازج', 'لحوم وخظروات فواكه',
                        'assets/image/public1.jpg'),
                ])),
            Divider(),
//-----------end bock offer from 30% to 50%
          ],
        ),
      ),
    );
  }

  Container bock_register(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      margin: EdgeInsets.only(right: 20, left: 20, top: 15),
      width: MediaQuery.of(context).size.width,
      height: 140,
      decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.orange, width: 3),
          //borderRadius: BorderRadius.all(Radius.circular(10))),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )),
      child: Row(
        children: [
          Expanded(
              flex: 6,
              child: Column(
                children: [
                  Text(
                    'سجل الدخول أو قم بالتسجيل للاستفادة من كافة العروض والخدمات ....',
                    style: TextStyle(fontSize: 14),
                  ),
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 30,
                      child: Text("تسجيل/دخول",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      decoration: BoxDecoration(
                          color: Colors.orange[700],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    onTap: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.WARNING,
                        animType: AnimType.SCALE,
                        title: 'نافذة التسجيل',
                        desc:
                            ' ....... لم يتم تفعيل نافذة التسجيل انتظرونا قريبا  ' +
                                '\n' +
                                'Ok تم التسجيل افتراضيا' +
                                '\n' +
                                'Cancal لم يتم التسجيل',
                        btnCancelColor: Colors.orange[500],
                        btnOkColor: Colors.orange[800],
                        dialogBackgroundColor: Colors.orange[50],
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {
                          ShareDataSave('Administrator',
                              'admin@mytalabat.com'); // call function to save data
                          isregisted(); // call method to check and get data
                        },
                      ).show();
                    },
                  )
                ],
              )),
          Expanded(
              flex: 4,
              child: CircleAvatar(
                backgroundColor: Colors.grey[500],
                radius: 50,
                child: Icon(
                  Icons.person,
                  size: 70,
                  color: Colors.white,
                ),
              ))
        ],
      ),
    );
  }

  Carousel buildCarousel() {
    return Carousel(
      boxFit: BoxFit.cover,
      autoplay: true,
      autoplayDuration: Duration(seconds: 3),
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
      dotSize: 6.0,
      dotIncreaseSize: 6,
      dotSpacing: 20,
      dotIncreasedColor: Colors.orange[500],
      dotBgColor: Colors.transparent,
      //dotBgColor: Colors.blue[50],
      dotPosition: DotPosition.bottomCenter,
      dotVerticalPadding: 0.0,
      dotHorizontalPadding: 0.0,
      showIndicator: true,
      indicatorBgPadding: 0.0,
      borderRadius: true,
      radius: Radius.circular(10),
      overlayShadow: true,
      overlayShadowColors: Colors.red[100],
      overlayShadowSize: 10,
      images: [
        ExactAssetImage("assets/image/offer4.jpg"),
        AssetImage('assets/image/offer3.jpg'),
        AssetImage('assets/image/offer2.jpg'),
        AssetImage('assets/image/offer1.png'),
      ],
    );
  }

// block_num_1

  Container block_num_1(BuildContext context) {
    return Container(
      //color: Colors.orange[500],
      margin: EdgeInsets.only(right: 20, left: 20, top: 10),
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.orange[500],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              height: 25,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    //print("object");
                    Closed();
                  },
                  icon: Icon(Icons.close))),
          Row(
            children: [
              Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,

                        width: MediaQuery.of(context).size.width,
                        //color: Colors.red[300],
                        child: Image(
                            image: AssetImage('assets/image/talabat-logo.png')),
                        height: 70,
                      ),
                      Container(
                        child: Text(
                          "محتاج مساعدة لشراء الراشن",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text("ما عليك نحن هنا"),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(top: 20),
                        width: 100,
                        padding: EdgeInsets.all(10),
                        child: Text("اطلب الحين ..."),
                        decoration: BoxDecoration(
                            color: Colors.red[400],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 4,
                  child: Container(
                      child: Image(
                    image: AssetImage('assets/image/cart.png'),
                  )))
            ],
          )
        ],
      ),
    );
  }

//--------block_num_2-------
  Container block_num_2(BuildContext context, title, subtitle, image) {
    return Container(
      width: 150,
      height: 150,
      child: ListTile(
        title: Image(
          image: AssetImage(image),
          height: 100,
        ),
        subtitle: Container(
          child: Column(
            children: [
              Text(title, textAlign: TextAlign.center),
              Text(subtitle, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}

// show dialogs - your locations
class showDialogs extends StatelessWidget {
  const showDialogs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        elevation: 0.0,
        // title: Center(child: Text("Evaluation our APP")),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: width,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Column(
                children: [
                  Text("a"),
                  Divider(),
                  Text("b"),
                  Divider(),
                  Text("c"),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0))),
              child: Center(
                  child: InkWell(
                child: Text("اغلاق"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              )),
            )
          ],
        ));
  }
}
