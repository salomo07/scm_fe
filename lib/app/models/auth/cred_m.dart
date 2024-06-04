import 'dart:convert';

CredToken credTokenFromJson(String str) => CredToken.fromJson(json.decode(str));

String credTokenToJson(CredToken data) => json.encode(data.toJson());

class CredToken {
    String token;
    DateTime exp;

    CredToken({
        required this.token,
        required this.exp,
    });

    factory CredToken.fromJson(Map<String, dynamic> json) => CredToken(
        token: json["token"],
        exp: DateTime.parse(json["exp"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "exp": exp.toIso8601String(),
    };
}