import 'dart:convert';

List<Usermodel> userFromJson(String str) =>
    List<Usermodel>.from(json.decode(str).map((x) => Usermodel.fromJson(x)));

String userToJson(List<Usermodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usermodel {
  Usermodel({
    this.userId,
    this.username,
    this.password,
    this.name,
    this.tel,
    this.teltwo,
    this.department,
    this.email,
  });

  int userId;
  String username;
  String password;
  String name;
  String tel;
  String teltwo;
  String department;
  String email;

  factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
        userId: json["user_id"],
        username: json["username"],
        password: json["password"],
        name: json["name"],
        tel: json["tel"],
        teltwo: json["teltwo"],
        department: json["department"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "password": password,
        "name": name,
        "tel": tel,
        "teltwo": teltwo,
        "department": department,
        "email": email,
      };
}
