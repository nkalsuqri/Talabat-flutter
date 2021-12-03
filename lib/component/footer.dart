import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
