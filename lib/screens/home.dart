import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusefern/screens/register.dart';

import 'login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      appBar: AppBar(),
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
                Container(padding: const EdgeInsets.all(30.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(),
                      width: 200,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => Login(),
                              ));
                        },
                        child: Text(
                          'เข้าสู่ระบบ',
                          style: TextStyle(
                              height: 1, fontSize: 20, color: Colors.white),
                        ),
                        color: Colors.blue.shade900,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(),
                      width: 200,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => Register(),
                              ));
                        },
                        child: Text(
                          'ลงทะเบียน',
                          style: TextStyle(
                              height: 1, fontSize: 20, color: Colors.white),
                        ),
                        color: Colors.blue.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
