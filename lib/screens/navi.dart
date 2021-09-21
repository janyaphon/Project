import 'package:flutter/material.dart';
import 'package:fusefern/screens/manage.dart';
import 'package:fusefern/screens/search.dart';
import 'package:fusefern/screens/status.dart';
import 'package:fusefern/screens/welcome.dart';

class Navi extends StatefulWidget {
  @override
  _NaviState createState() => _NaviState();
}

class _NaviState extends State<Navi> {
  List<Widget> listWidgets = [Welcome(), Search(), Status(), Setting()];
  int indexPage = 0;

  BottomNavigationBarItem showWelcomNav() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text("หน้าหลัก"),
      backgroundColor: Colors.blue,
    );
  }

  BottomNavigationBarItem showSearchNav() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.search),
      title: Text("ค้นหา"),
      backgroundColor: Colors.blue,
    );
  }

  BottomNavigationBarItem showStatusNav() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.check),
      title: Text("สถานะ"),
      backgroundColor: Colors.blue,
    );
  }

  BottomNavigationBarItem showManageNav() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      title: Text("ตั้งค่า"),
      backgroundColor: Colors.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listWidgets[indexPage],
      bottomNavigationBar: showBottonNavigationBar(),
    );
  }

  BottomNavigationBar showBottonNavigationBar() => BottomNavigationBar(
        // selectedItemColor: Colors.blue,
        currentIndex: indexPage,
        onTap: (value) {
          setState(() {
            indexPage = value;
          });
        },
        items: <BottomNavigationBarItem>[
          showWelcomNav(),
          showSearchNav(),
          showStatusNav(),
          showManageNav(),
        ],
      );
}

class Manage {}
