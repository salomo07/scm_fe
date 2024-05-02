import 'dart:convert';

List<Menu> menuFromJson(String str) => List<Menu>.from(json.decode(str).map((x) => Menu.fromJson(x)));

String menuToJson(List<Menu> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Menu {
    String? idMenu;
    String? label;
    String? iconCode;
    String? path;
    List<Menu>? subMenu;

    Menu({
        this.idMenu,
        this.label,
        this.iconCode,
        this.path,
        this.subMenu,
    });

    factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        idMenu: json["idMenu"],
        label: json["label"],
        iconCode: json["iconCode"],
        path: json["path"],
        subMenu: json["subMenu"] == null ? [] : List<Menu>.from(json["subMenu"]!.map((x) => Menu.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "idMenu": idMenu,
        "label": label,
        "iconCode": iconCode,
        "path": path,
        "subMenu": subMenu == null ? [] : List<dynamic>.from(subMenu!.map((x) => x.toJson())),
    };
}