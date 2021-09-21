import 'package:flutter/material.dart';
import 'package:fusefern/model/equipmentmodel.dart';
import 'package:fusefern/services/equipmentservice.dart';

class Status extends StatefulWidget {
  // const Status({Key? key}) : super(key: key);

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  bool loading = true;
  List<Equipmentmodel> equipmentList = [];

  getAllEquipment() async {
    equipmentList = await Equipmentservice().getEquipment();
    setState(() {
      loading = false;
    });
    print(equipmentList.length.toString());
  }

  @override
  void initState() {
    super.initState();
    getAllEquipment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Status"),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: equipmentList.length,
              itemBuilder: (context, index) {
                Equipmentmodel view = equipmentList[index];
                return showEquipment(view);
              },
            ),
    );
  }

  Widget showEquipment(Equipmentmodel view) {
    return ListTile(
      title: Text(view.equipmentName,
          style: TextStyle(
            color: Colors.blue.shade900,
          )),
      subtitle: Text(view.equipmentStatus.toString()),
    );
  }
}
