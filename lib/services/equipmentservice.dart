import 'package:flutter/material.dart';
import 'package:fusefern/model/equipmentmodel.dart';
import 'package:http/http.dart' as http;

class Equipmentservice {
  static const ViewEquipment = "http://192.168.118.76/ProjectApp/view.php";
  static const ViewEquipmentbyscan =
      "http://192.168.118.76/ProjectApp/viewscan.php";
  static const RequestEquipmentbyscan =
      "http://192.168.118.76/ProjectApp/request.php";

  Future<List<Equipmentmodel>> getEquipment() async {
    final response = await http.get(Uri.parse(ViewEquipment));
    print(response.statusCode);
    if (response.statusCode == 200) {
      List<Equipmentmodel> list = equipmentFromJson(response.body);
      return list;
    } else {
      return <Equipmentmodel>[];
    }
  }

  Future<List<Equipmentmodel>> getEquipmentbyscan(data) async {
    final response =
        await http.post(Uri.parse(ViewEquipmentbyscan), body: data);
    print(response.statusCode);
    print("status");
    if (response.statusCode == 200) {
      List<Equipmentmodel> list = equipmentFromJson(response.body);
      return list;
    } else {
      return <Equipmentmodel>[];
    }
  }

  Future<String> requestEquipmentbyscan(data) async {
    final response =
        await http.post(Uri.parse(RequestEquipmentbyscan), body: data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
