import 'dart:convert';

MenuOptions menuOptionsFromJson(String str) => MenuOptions.fromJson(json.decode(str));

String menuOptionsToJson(MenuOptions data) => json.encode(data.toJson());

class MenuOptions {
    String title;
    String route;

    MenuOptions({
        required this.title,
        required this.route,
    });

    factory MenuOptions.fromJson(Map<String, dynamic> json) => MenuOptions(
        title: json["title"],
        route: json["route"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "route": route,
    };
}