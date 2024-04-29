// To parse this JSON data, do
//
//     final monitorInfo = monitorInfoFromJson(jsonString);

import 'dart:convert';

MonitorInfo monitorInfoFromJson(String str) =>
    MonitorInfo.fromJson(json.decode(str));

String monitorInfoToJson(MonitorInfo data) => json.encode(data.toJson());

class MonitorInfo {
  int id;
  String text;
  List<MonitorInfo> children;
  String min;
  String value;
  String max;
  String imageUrl;

  MonitorInfo({
    required this.id,
    required this.text,
    required this.children,
    required this.min,
    required this.value,
    required this.max,
    required this.imageUrl,
  });

  factory MonitorInfo.fromJson(Map<String, dynamic> json) => MonitorInfo(
        id: json["id"],
        text: json["Text"],
        children: List<MonitorInfo>.from(
            json["Children"].map((x) => MonitorInfo.fromJson(x))),
        min: json["Min"],
        value: json["Value"],
        max: json["Max"],
        imageUrl: json["ImageURL"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Text": text,
        "Children": List<dynamic>.from(children.map((x) => x.toJson())),
        "Min": min,
        "Value": value,
        "Max": max,
        "ImageURL": imageUrl,
      };
}
