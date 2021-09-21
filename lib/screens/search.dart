import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fusefern/model/equipmentmodel.dart';
import 'package:fusefern/services/equipmentservice.dart';
import 'package:fusefern/utility/my_style.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:shared_preferences/shared_preferences.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String uid = "";
  String name = "";
  String scanresult;

  String equipid = '';
  String equipname = '';
  String equipinfo = '';
  String equipstatus = '';
  String equipbeacon = '';
  List<Equipmentmodel> equipmentList = [];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 400,
          width: double.infinity,
          child: SizedBox(
              child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'ผลการสแกน',
                    style: TextStyle(
                        fontSize: 30,
                        color: MyStyle().darkColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Text(
                        "Equipment ID : ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      Text(
                        equipid.isNotEmpty ? equipid : "ยังไม่มีข้อมูล",
                      ),
                    ],
                  ),
                  MyStyle().mySizebox(),
                  Row(
                    children: [
                      Text(
                        "Equipment Name : ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      Text(equipname.isNotEmpty ? equipname : "ยังไม่มีข้อมูล"),
                    ],
                  ),
                  MyStyle().mySizebox(),
                  Row(
                    children: [
                      Text(
                        "Equipment Info: ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      Text(equipinfo.isNotEmpty ? equipinfo : "ยังไม่มีข้อมูล"),
                    ],
                  ),
                  MyStyle().mySizebox(),
                  Row(
                    children: [
                      Text(
                        "Equipment Status : ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      Text(equipstatus.isNotEmpty
                          ? equipstatus
                          : "ยังไม่มีข้อมูล"),
                    ],
                  ),
                  MyStyle().mySizebox(),
                  Row(
                    children: [
                      Text(
                        "Beacon Code : ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              equipbeacon.isNotEmpty
                                  ? equipbeacon
                                  : "ยังไม่มีข้อมูล",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  MyStyle().mySizebox(),
                  MyStyle().mySizebox(),
                  requestButton()
                ],
              ),
            ),
          )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: startscan,
        child: Icon(Icons.qr_code_scanner_sharp),
      ),
    );
  }

  searchequipment(scan) async {
// เอาตัวแปร scan ไปดึงค่าจากตารางมา
    var data = {
      'equipment_id': scan,
    };
    equipmentList = await Equipmentservice().getEquipmentbyscan(data);
    print(equipmentList[0].equipmentbeacon);
    print("Beacon_ID");

    if (equipmentList.length == 1) {
      setState(() {
        equipid = equipmentList[0].equipmentId.toString();
        equipname = equipmentList[0].equipmentName.toString();
        equipinfo = equipmentList[0].equipmentInfo.toString();
        equipstatus = equipmentList[0].equipmentStatus.toString();
        equipbeacon = equipmentList[0].equipmentbeacon.toString();
      });
    }
  }

  requestEquipmentbyscan() async {
    var data = {
      'equipment_id': equipid,
      'user_id': uid,
    };
    return await Equipmentservice().requestEquipmentbyscan(data);
  }

  startscan() async {
    String cameraScanResult = await scanner.scan();
    setState(() {
      scanresult = cameraScanResult; //เรียกลิงค์นี้มา
    });
    searchequipment(scanresult);
  }

  Widget requestButton() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 250.0,
              child: RaisedButton(
                color: MyStyle().darkColor,
                onPressed: () {
                  requestEquipmentbyscan().then((value) {
                    print(value);
                    if (value != "") {
                      Fluttertoast.showToast(
                          msg: "Request Successful",
                          // toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  });
                },
                child: Text(
                  'Request',
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ],
      );
}
