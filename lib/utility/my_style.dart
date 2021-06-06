import 'package:flutter/material.dart';

class MyStyle {
  Color darkColor = Colors.blue.shade900;

  SizedBox mySizebox() => SizedBox(
        width: 8.0,
        height: 16.0,
      );

  Text showTiitle(String title) => Text(
        title,
        style: TextStyle(
            height: 1.5,
            fontSize: 30,
            color: Colors.blue.shade900,
            fontWeight: FontWeight.bold),
      );

  Container showLogo() {
    return Container(
      width: 120.0,
      child: Image.asset('img/logo.png'),
    );
  }

  MyStyle();
}
