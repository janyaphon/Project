import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fusefern/utility/my_style.dart';
import 'package:toast/toast.dart';
import 'package:fusefern/model/usermodel.dart';
import 'package:fusefern/screens/welcome.dart';
import 'package:fusefern/services/userservice.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatefulWidget {
  const Setting({key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String uid = "";
  String name = "";
  String username = "";
  String password = "";
  String tel = "";
  String teltwo = "";
  String department = "";
  String email = "";

  bool loading = true;
  List<Usermodel> userList = [];

  final formKey = GlobalKey<FormState>();
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController telephon = TextEditingController();
  TextEditingController telephontwo = TextEditingController();
  TextEditingController depart = TextEditingController();
  TextEditingController mail = TextEditingController();

  getAllUser() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      uid = prefs.getString("user_id");
      username = prefs.getString("username");
      password = prefs.getString("password");
      name = prefs.getString("name");
      tel = prefs.getString("tel");
      teltwo = prefs.getString("teltwo");
      department = prefs.getString("department");
      email = prefs.getString("email");
    });
    userList = await Userservice().getUser(uid);
    setState(() {
      loading = false;
    });
    print(userList);
    print(userList.length.toString());
    if (userList.length == 1) {
      fullname = TextEditingController(text: userList[0].name);
      user = TextEditingController(text: userList[0].username);
      pass = TextEditingController(text: userList[0].password);
      telephon = TextEditingController(text: userList[0].tel);
      telephontwo = TextEditingController(text: userList[0].teltwo);
      depart = TextEditingController(text: userList[0].department);
      mail = TextEditingController(text: userList[0].email);
    }
  }

  edit() async {
    var data = {
      'userid': uid,
      'fullname': fullname.text,
      'password': pass.text,
      'telephon': telephon.text,
      'telephontwo': telephontwo.text,
      'department': depart.text,
      'email': mail.text,
    };
    return await Userservice().editUser(data);
  }

  @override
  void initState() {
    super.initState();
    getAllUser();
  }

  // void getUser() async {
  //   final SharedPreferences prefs = await _prefs;
  //   setState(() {
  //     uid = prefs.getString("user_id");
  //     name = prefs.getString("name");
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Setting"),
        ),
        body: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: formKey,
                child: ListView(
                  padding: EdgeInsets.all(30.0),
                  children: <Widget>[
                    MyStyle().mySizebox(),
                    userIDform(),
                    MyStyle().mySizebox(),
                    fullnameForm(),
                    MyStyle().mySizebox(),
                    usernameForm(),
                    MyStyle().mySizebox(),
                    passwordForm(),
                    MyStyle().mySizebox(),
                    telForm(),
                    MyStyle().mySizebox(),
                    tel2Form(),
                    MyStyle().mySizebox(),
                    departForm(),
                    MyStyle().mySizebox(),
                    emailForm(),
                    MyStyle().mySizebox(),
                    updateButton()
                  ],
                ),
              ));
  }

  Widget updateButton() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 250.0,
              child: RaisedButton(
                color: MyStyle().darkColor,
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    edit().then((value) {
                      print(value);
                      Fluttertoast.showToast(
                          msg: "Update Successful",
                          // toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    });
                  } else {
                    Fluttertoast.showToast(
                        msg: "Register Sccessful",
                        // toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ],
      );

  Widget userIDform() => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: 290,
              child: Card(
                color: Colors.blue[200],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      MyStyle().showLogo2(),
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
                    ],
                  ),
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
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_sharp,
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
                controller: user,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.account_circle,
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

  Widget passwordForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 280.0,
            child: TextFormField(
                controller: pass,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.vpn_key_rounded,
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

  Widget telForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 280.0,
            child: TextFormField(
                controller: telephon,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
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

  Widget tel2Form() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 280.0,
            child: TextFormField(
                controller: telephontwo,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: MyStyle().darkColor,
                  ),
                  labelStyle: TextStyle(color: MyStyle().darkColor),
                  labelText: 'Tel 2 ',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().darkColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().darkColor)),
                )),
          ),
        ],
      );

  Widget emailForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 280.0,
            child: TextFormField(
                controller: mail,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: MyStyle().darkColor,
                  ),
                  labelStyle: TextStyle(color: MyStyle().darkColor),
                  labelText: 'E-mail',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().darkColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().darkColor)),
                )),
          ),
        ],
      );

  Widget departForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 280.0,
            child: TextFormField(
                controller: depart,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: MyStyle().darkColor,
                  ),
                  labelStyle: TextStyle(color: MyStyle().darkColor),
                  labelText: 'Department',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().darkColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().darkColor)),
                )),
          ),
        ],
      );
}
