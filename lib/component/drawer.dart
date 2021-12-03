import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String username = '';
String email = '';
ShareDataGet() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  username = preferences.getString("username");
  email = preferences.getString("email");
  //print("emailoooo = " + username);
  return username;
}

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      print('object');
      ShareDataGet();
    });
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                username != null
                    ? Text(
                        username,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    : Text(
                        'Gest',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
              ],
            ),
            accountEmail: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  " nkalsuqri@gmail.com",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/image/person.jpg"),
              //backgroundImage: NetworkImage(
              //'https://p.kindpng.com/picc/s/21-211210_free-for-commercial-use-high-resolution-personal-icon.png'),
              radius: 40,
              backgroundColor: Colors.orange[500],
              child: Icon(
                Icons.person,
                color: Colors.black,
                size: 70,
              ),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.orange[900],
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 40,
                ),
              ),
              Text('data')
            ],
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
          ),
          theMenue(
              context, Icons.home, 'الصفحة الرئيسية', 'صفحتي الرئيسية', 'home'),
          Divider(
            color: Colors.grey[200],
            thickness: 2,
          ),
          theMenue(context, Icons.map, ' خرائط جوجل', ' الوصول للموقع - تجربة',
              'maping'),
          Divider(
            color: Colors.grey[200],
            thickness: 2,
          ),
          theMenue(context, Icons.menu_book, 'اعادة الطلب',
              'أعد طلبيتك السابقة', 'reorders'),
          Divider(
            color: Colors.grey[200],
            thickness: 2,
          ),
          theMenue(context, Icons.cases, '  العروض', 'تعرف على عروض زبائننا',
              'offers'),
          Divider(
            color: Colors.grey[200],
            thickness: 2,
          ),
          theMenue(
              context, Icons.note, '  الاشعارات', ' كن قريبا منا', 'alerts'),
          Divider(
            color: Colors.grey[200],
            thickness: 2,
          ),
          theMenue(
              context, Icons.topic, '  القسائم', ' تابع قسائمك', 'tickets'),
          Divider(
            color: Colors.grey[200],
            thickness: 2,
          ),
          theMenue(context, Icons.help, '  اخترنا لكم',
              '   أفضل المطاعم حسب تقييم زبائننا', 'foryou'),
          Divider(
            color: Colors.grey[200],
            thickness: 2,
          ),
          theMenue(
              context, Icons.help, '  المساعدة', ' هل ترغب بالمساعدة', 'helps'),
          Divider(
            color: Colors.grey[200],
            thickness: 2,
          ),
          theMenue(context, Icons.apps, ' حول التطبيق ', 'تعرف على التطبيق',
              'aboutapp'),
          Divider(
            color: Colors.grey[200],
            thickness: 2,
          ),
          Divider(
            color: Colors.grey[200],
            thickness: 2,
          ),
          theMenue(context, Icons.shopping_cart_outlined, '  our products ',
              'تعرف على التطبيق', 'ourproducts'),
        ],
      ),
    );
  }

  ListTile theMenue(context, icon, title, subtitle, page) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        //radius: 50,
        child: Icon(
          icon,
          color: Colors.orange[500],
          size: 25,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.orange[500],
        size: 20,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.black, fontSize: 10),
      ),
      isThreeLine: false,
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      onTap: () {
        Navigator.of(context).pushNamed(page);
      },
    );
  }
}
