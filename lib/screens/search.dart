import 'package:flutter/material.dart';
import 'package:fusefern/utility/my_style.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String scanresult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 300,
          width: double.infinity,
          child: SizedBox(
              child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ผลการสแกน',
                    style: TextStyle(
                      fontSize: 30,
                      color: MyStyle().darkColor,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(scanresult ??= "ยังไม่มีข้อมูล"),
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

  startscan() async {
    String cameraScanResult = await scanner.scan();
    setState(() {
      scanresult = cameraScanResult; //เรียกลิงค์นี้มา
    });
  }
}
