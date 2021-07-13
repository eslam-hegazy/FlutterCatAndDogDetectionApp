// To parse this JSON data, do
//
//     final nameModel = nameModelFromJson(jsonString);

import 'dart:convert';

NameModel nameModelFromJson(String str) => NameModel.fromJson(json.decode(str));

String nameModelToJson(NameModel data) => json.encode(data.toJson());

class NameModel {
  NameModel({
    this.name,
  });

  String name;

  factory NameModel.fromJson(Map<String, dynamic> json) => NameModel(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
