import 'dart:convert';

List<Equipmentmodel> equipmentFromJson(String str) => List<Equipmentmodel>.from(
    json.decode(str).map((x) => Equipmentmodel.fromJson(x)));

String equipmentToJson(List<Equipmentmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Equipmentmodel {
  Equipmentmodel({
    this.equipmentId,
    this.equipmentName,
    this.equipmentStatus,
    this.equipmentInfo,
    this.equipmentbeacon,
  });

  String equipmentId;
  String equipmentName;
  String equipmentStatus;
  String equipmentInfo;
  String equipmentbeacon;

  factory Equipmentmodel.fromJson(Map<String, dynamic> json) => Equipmentmodel(
        equipmentId: json["Equipment_ID"],
        equipmentName: json["Equipment_name"],
        equipmentStatus: json["Equipment_Status"],
        equipmentInfo: json["Equipment_info"],
        equipmentbeacon: json["Beacon_code"],
      );

  Map<String, dynamic> toJson() => {
        "Equipment_ID": equipmentId,
        "Equipment_name": equipmentName,
        "Equipment_Status": equipmentStatus,
        "Equipment_info": equipmentInfo,
        "Beacon_code": equipmentbeacon,
      };
}
