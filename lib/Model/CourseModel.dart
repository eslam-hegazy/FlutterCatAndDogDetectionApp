// To parse this JSON data, do
//
//     final courseModel = courseModelFromJson(jsonString);

import 'dart:convert';

CourseModel courseModelFromJson(String str) =>
    CourseModel.fromJson(json.decode(str));

String courseModelToJson(CourseModel data) => json.encode(data.toJson());

class CourseModel {
  CourseModel({
    this.title,
    this.url,
    this.num,
  });

  String title;
  String url;
  String num;

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        title: json["title"],
        url: json["url"],
        num: json["num"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
        "num": num,
      };
}
