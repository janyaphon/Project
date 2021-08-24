import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fusefern/main.dart';
import 'package:fusefern/utility/my_style.dart';
import 'package:fusefern/utility/normal_dialog.dart';

import 'package:http/http.dart' as http;

import 'home.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  // String fullname, username, tel, password, conpass;
  TextEditingController fullname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController tel = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conpass = TextEditingController();

  Future register() async {
    var url = Uri.parse("http://192.168.101.76/ProjectApp/register.php");
    var response = await http.post(url, body: {
      'name': fullname.text,
      'username': username.text,
      'tel': tel.text,
      'password': password.text,
    });

    var data = json.decode(response.body);
    if (data == "ERROR") {
      Fluttertoast.showToast(
          msg: "This User Already Exit!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Register Sccessful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(30.0),
          children: <Widget>[
            myLogo(),
            showAppName(),
            showAppName2(),
            MyStyle().mySizebox(),
            fullnameForm(),
            MyStyle().mySizebox(),
            usernameForm(),
            MyStyle().mySizebox(),
            telForm(),
            MyStyle().mySizebox(),
            passwordForm(),
            MyStyle().mySizebox(),
            conpassForm(),
            MyStyle().mySizebox(),
            registerButton(),
          ],
        ),
      ),
    );
  }

  Widget registerButton() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 250.0,
              child: RaisedButton(
                color: MyStyle().darkColor,
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    username.text;
                    password.text;
                    fullname.text;
                    tel.text;
                    conpass.text;
                    register();
                  }
                  // print(
                  //     'Fullname = $fullname, Username = $username, Tel = $tel, Password = $password, Confirm password = $conpass');
                  // if (fullname == null ||
                  //     fullname.isEmpty ||
                  //     username == null ||
                  //     username.isEmpty ||
                  //     tel == null ||
                  //     tel.isEmpty ||
                  //     password == null ||
                  //     password.isEmpty ||
                  //     conpass == null ||
                  //     conpass.isEmpty) {
                  //   print('Have Space');
                  //   normalDialog(context, 'มีช่องว่าง กรุณากรอกให้ครบทุกช่อง');
                  // }
                },
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ],
      );

  Widget fullnameForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 280.0,
            child: TextFormField(
                controller: fullname,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Fullname';
                  }
                  return null;
                },
                // onChanged: (value) => fullname = value.trim(),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.account_box,
                    color: MyStyle().darkColor,
                  ),
                  labelStyle: TextStyle(color: MyStyle().darkColor),
                  labelText: 'Fullname',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().darkColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().darkColor)),
                )),
          ),
        ],
      );

  Widget usernameForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 280.0,
            child: TextFormField(
                controller: username,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Username';
                  }
                  return null;
                },
                // onChanged: (value) => username = value.trim(),
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
          ),
        ],
      );

  Widget telForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 280.0,
            child: TextFormField(
                controller: tel,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Tel';
                  }
                  return null;
                },
                // onChanged: (value) => tel = value.trim(),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.account_box,
                    color: MyStyle().darkColor,
                  ),
                  labelStyle: TextStyle(color: MyStyle().darkColor),
                  labelText: 'Tel',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().darkColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().darkColor)),
                )),
          ),
        ],
      );

  Widget passwordForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 280.0,
            child: TextFormField(
                controller: password,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Password';
                  }
                  return null;
                },
                // onChanged: (value) => password = value.trim(),
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.account_box,
                    color: MyStyle().darkColor,
                  ),
                  labelStyle: TextStyle(color: MyStyle().darkColor),
                  labelText: 'Password',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().darkColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().darkColor)),
                )),
          ),
        ],
      );

  Widget conpassForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 280.0,
            child: TextFormField(
                controller: conpass,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Confirm Password';
                  }
                  if (!(value == password.text)) {
                    return ' Your Password does not match';
                  }
                  return null;
                },
                // onChanged: (value) => conpass = value.trim(),
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.account_box,
                    color: MyStyle().darkColor,
                  ),
                  labelStyle: TextStyle(color: MyStyle().darkColor),
                  labelText: 'Confirm password',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().darkColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().darkColor)),
                )),
          ),
        ],
      );

  Row showAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MyStyle().showTiitle('FCEA'),
        // MyStyle().showTiitle2('Find construction equipment application'),
      ],
    );
  }

  Row showAppName2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MyStyle().showTiitle2('Find construction equipment application'),
      ],
    );
  }

  Widget myLogo() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MyStyle().showLogo(),
        ],
      );
}
