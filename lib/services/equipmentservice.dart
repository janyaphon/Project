import 'package:flutter/material.dart';
import 'package:fusefern/model/equipmentmodel.dart';
import 'package:http/http.dart' as http;

class Equipmentservice {
  static const ViewEquipment = "http://192.168.101.76/ProjectApp/view.php";

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
}
