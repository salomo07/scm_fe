import 'dart:convert';

List<Role> roleFromJson(String str) => List<Role>.from(json.decode(str).map((x) => Role.fromJson(x)));

String roleToJson(List<Role> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Role {
    String id;
    String name;
    String code;
    String desc;

    Role({
        required this.id,
        required this.name,
        required this.code,
        required this.desc,
    });

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["_id"],
        name: json["name"],
        code: json["code"],
        desc: json["desc"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "code": code,
        "desc": desc,
    };
}