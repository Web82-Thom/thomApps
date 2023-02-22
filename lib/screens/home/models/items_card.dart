import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:thomapps/ressources/utils.dart';

class ItemsCard {
  int? id;
  Color? color;
  String? title;
  Icon? icon;

  ItemsCard({required this.id ,required this.color, required this.title, required this.icon,});

  Map<String, dynamic> toMap()=> {

    "id": id ?? "n.c.",
    "color": color ?? "n.c.",
    "title": title ?? "n.c.",
    "icon": icon ?? "n.c.",
    
  };


  ItemsCard.fromMap(DocumentSnapshot data) {
    id = data["id"];
    color = data["color"];
    title = data["title"];
    icon = data["icon"];
  }
}