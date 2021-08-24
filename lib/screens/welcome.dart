import 'package:flutter/material.dart';
import 'package:fusefern/screens/login.dart';
import 'package:fusefern/screens/manage.dart';
import 'package:fusefern/screens/search.dart';
import 'package:fusefern/screens/status.dart';
import 'package:fusefern/utility/my_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String uid = "";
  String name = "";

  @override
  void initState() {
    super.initState();
    getPref();
  }

  void getPref() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      uid = prefs.getString("user_id");
      name = prefs.getString("name");
    });
  }

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
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ));
              })
        ],
      ),
      body: Container(
        // child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyStyle().mySizebox(),
              MyStyle().mySizebox(),
              // MyStyle().showLogo(),
              // MyStyle().showTiitle2('Find construction equipment application'),

              // Container(
              //   child: Title(
              //       color: Colors.blue.shade900,
              //       child: Text(
              //         'Find construction equipment application',
              //         style: TextStyle(
              //             height: 1.5,
              //             fontSize: 15,
              //             color: Colors.blue.shade900),
              //       )),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(30.0),
              //   child: Container(
              //     color: Colors.blue[200],
              //     child: Column(
              //       children: [
              //         SizedBox(height: 10),
              //         Row(children: [
              //           Text(
              //             "  รหัสผู้ใช้ :   ",
              //             style: TextStyle(
              //                 fontSize: 18, color: Colors.blue.shade900),
              //           ),
              //           Text(
              //             uid.toString(),
              //             style: TextStyle(
              //                 fontSize: 18,
              //                 color: Colors.blue.shade900,
              //                 fontWeight: FontWeight.bold),
              //           ),
              //         ]),
              //         Row(children: [
              //           Text(
              //             "  ชื่อผู้ใช้ :  ",
              //             style: TextStyle(
              //                 fontSize: 18, color: Colors.blue.shade900),
              //           ),
              //           Text(
              //             name.toString(),
              //             style: TextStyle(
              //                 fontSize: 18,
              //                 color: Colors.blue.shade900,
              //                 fontWeight: FontWeight.bold),
              //           ),
              //         ]),
              //         SizedBox(height: 10),
              //       ],
              //     ),
              //   ),
              // ),

              //ช่องโชว์ชื่อผู้ใช้
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 85,
                    width: double.infinity,
                    child: SizedBox(
                      child: Card(
                        color: Colors.blue[200],
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  MyStyle().showLogo2(),
                                  Row(
                                    children: [
                                      Text("    "),
                                      Text("ID : ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.blue.shade900,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                        uid.toString(),
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.blue.shade900,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("   "),
                                      Text(
                                        name.toString(),
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.blue.shade900,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ]),
                              ],
                            )),
                      ),
                    )),
              ),
              MyStyle().mySizebox(),

              //ช่องโชว์สถานะบลูทูธ
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 110,
                    width: double.infinity,
                    child: SizedBox(
                      child: Card(
                        color: Colors.blue[100],
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '  เชื่อมต่อบลูทูธ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: MyStyle().darkColor,
                                  ),
                                ),
                                Container(
                                  child: Card(
                                    color: Colors.white,
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
                                              Icon(Icons
                                                  .bluetooth_connected_sharp),
                                              Text(
                                                "  สถานะ :   ",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color:
                                                        Colors.blue.shade900),
                                              ),
                                            ]),
                                          ],
                                        )),
                                  ),
                                )
                              ],
                            )),
                      ),
                    )),
              ),
              MyStyle().mySizebox(),
              // โชว์ที่ติดต่อเรา
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 200,
                    width: double.infinity,
                    child: SizedBox(
                      child: Card(
                        color: Colors.blue[100],
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyStyle().mySizebox(),
                                Row(children: [
                                  Text(
                                    "  ติดต่อเรา    ",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.blue.shade900,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                                MyStyle().mySizebox(),
                                MyStyle().mySizebox(),
                                Row(children: [
                                  Text("       "),
                                  Icon(Icons.phone_callback_sharp),
                                  Text(
                                    "  : 098 017 2034 ",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue.shade900,
                                    ),
                                  ),
                                ]),
                                MyStyle().mySizebox(),
                                Row(children: [
                                  Text("       "),
                                  Icon(Icons.mail_sharp),
                                  Text(
                                    "  : Chuaypichai62@gmail.com ",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blue.shade900),
                                  ),
                                ]),
                              ],
                            )),
                      ),
                    )),
              ),
            ],
          ),
        ),
        // ),
      ),
    );
  }
}
