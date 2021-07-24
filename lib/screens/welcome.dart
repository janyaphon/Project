import 'package:flutter/material.dart';
import 'package:fusefern/screens/manage.dart';
import 'package:fusefern/screens/search.dart';
import 'package:fusefern/screens/status.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  Widget showLogo() {
    return Container(
      width: 200.0,
      height: 200.0,
      child: Image.asset('img/logo.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                showLogo(),
                Container(
                  child: Title(
                      color: Colors.blue.shade900,
                      child: Text(
                        'FCEA',
                        style: TextStyle(
                            height: 1.5,
                            fontSize: 35,
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                Container(
                  child: Title(
                      color: Colors.blue.shade900,
                      child: Text(
                        'Find construction equipment application',
                        style: TextStyle(
                            height: 1.5,
                            fontSize: 15,
                            color: Colors.blue.shade900),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
