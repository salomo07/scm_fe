import 'dart:convert';

CommonResponse commonResponseFromJson(String str) => CommonResponse.fromJson(json.decode(str));

String commonResponseToJson(CommonResponse data) => json.encode(data.toJson());

class CommonResponse {
    int? code;
    String? title;
    String? messege;
    List<dynamic>? data;

    CommonResponse({
        this.code,
        this.title,
        this.messege,
        this.data,
    });

    factory CommonResponse.fromJson(Map<String, dynamic> json) => CommonResponse(
        code: json["code"],
        title: json["title"],
        messege: json["messege"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "title": title,
        "messege": messege,
        "data": List<dynamic>.from(data!.map((x) => x)),
    };
}