import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fusefern/screens/navi.dart';
import 'package:fusefern/utility/my_style.dart';
import 'package:fusefern/utility/normal_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final formKey = GlobalKey<FormState>();
  // String username, password;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future login() async {
    var url = Uri.parse("http://192.168.101.76/ProjectApp/login.php");
    var response = await http.post(url, body: {
      'username': username.text,
      'password': password.text,
    });
    print(response.body);

    var data = json.decode(response.body);
    print(data['flag']);
    if (data['flag'] == "Success") {
      //shared_preferences ใช้แพจเก็จ ในการเก็บค่า
      final SharedPreferences prefs = await _prefs;
      prefs.setString("user_id", data["uid"]);
      prefs.setString("name", data["name"]);
      Fluttertoast.showToast(
          msg: "Login Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Navi()));
    } else {
      Fluttertoast.showToast(
          msg: "Username & Password Incorrect",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MyStyle().showLogo(),
                MyStyle().showTiitle('FCEA'),
                MyStyle()
                    .showTiitle2('Find construction equipment application'),
                MyStyle().mySizebox(),
                MyStyle().mySizebox(),
                usernameForm(),
                MyStyle().mySizebox(),
                passwordForm(),
                MyStyle().mySizebox(),
                loginButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 250.0,
              child: RaisedButton(
                color: MyStyle().darkColor,
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    login();
                  }
                  // print(' Username = $_username, Password = $_password');
                  // if (_username == null ||
                  //     username.isEmpty ||
                  //     password == null ||
                  //     password.isEmpty) {
                  //   print('Have Space');
                  //   normalDialog(context, 'มีช่องว่าง กรุณากรอกให้ครบทุกช่อง');
                  // }
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ],
      );

  Widget usernameForm() => Container(
        width: 280.0,
        child: TextFormField(
            controller: username,
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter Username';
              }
              return null;
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.account_box,
                color: MyStyle().darkColor,
              ),
              labelStyle: TextStyle(color: MyStyle().darkColor),
              labelText: 'Username',
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().darkColor)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().darkColor)),
            )),
      );

  Widget passwordForm() => Container(
        width: 280.0,
        child: TextFormField(
            controller: password,
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter Password';
              }
              return null;
            },
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                color: MyStyle().darkColor,
              ),
              labelStyle: TextStyle(color: MyStyle().darkColor),
              labelText: 'Password',
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().darkColor)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().darkColor)),
            )),
      );
}
