import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusefern/model/usermodel.dart';
import 'package:http/http.dart' as http;

class Userservice {
  static const Viewuser = "http://192.168.118.76/ProjectApp/user.php";
  static const Updateuser = "http://192.168.118.76/ProjectApp/update.php";

  Future<List<Usermodel>> getUser(uid) async {
    print(uid);
    final response = await http.post(Uri.parse(Viewuser), body: {
      'userid': uid,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      List<Usermodel> list = userFromJson(response.body);
      return list;
    } else {
      return <Usermodel>[];
    }
  }

  Future<String> editUser(data) async {
    final response = await http.post(Uri.parse(Updateuser), body: data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      // List<Usermodel> list = userFromJson(response.body);
      return response.body;
    } else {
      return "";
    }
  }
}
