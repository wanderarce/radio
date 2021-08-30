import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Radios {
  int? id;
  String? name;
  String? url;
  String? album;
  String? title;
  IconData icon = Icons.play_arrow_outlined;
  Radios({this.id, this.name, this.url});

  Radios.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
