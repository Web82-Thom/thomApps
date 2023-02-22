import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thomapps/ressources/utils.dart';

class Contact {
  String? authorId;
  String? authorName;
  String? authorEmail;
  String? content;
  DateTime? createdAt;

  Contact({required this.authorId, required this.authorName, required this.authorEmail, required this.content, required this.createdAt});

  Map<String, dynamic> toMap()=> {
    "authorId": authorId ?? "n.c.",
    "authorName": authorName ?? "n.c.",
    "authorEmail": authorEmail ?? "n.c.",
    "content": content ?? "n.c.",
    "createdAt": createdAt ?? DateTime.now(),
  };


  Contact.fromMap(DocumentSnapshot data) {
    authorId = data["id"];
    authorName = data["email"];
    authorEmail = data["username"];
    content = data["url"];
    createdAt = Utils.toDateTime(data["createdAt"])!;
  }
}