import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thomapps/ressources/utils.dart';

class UserModel {
  String? id;
  String? email;
  String? username;
  String? url;
  // DateTime? birthday;
  // String? city;
  // bool? isPrivate;
  // double? rating;
  // String? status;
  // String? subscription;
  // int? premiumTicket;

  UserModel({this.id, this.email, this.username, this.url, }); //this.birthday, this.city, this.status, this.isPrivate, this.rating, this.subscription, this.premiumTicket

  Map<String, dynamic> toMap()=> {
    "email": email,
    "id": id,
    "username": username ?? "NoName",
    "url": url ?? "users/profile.png",
    // "birthday": Timestamp.fromDate(birthday!),
    // "city": city ?? "NoWhere",
    // "isPrivate": isPrivate ?? false,
    // "rating": rating ?? 0.0,
    // "status": status ?? "member",
    // "subscription": subscription ?? "free",
    // "premiumTicket": premiumTicket ?? 0,
  };


  UserModel.fromMap(DocumentSnapshot data) {
    id = data["id"];
    email = data["email"];
    username = data["username"];
    url = data["url"];
    // birthday = Utils.toDateTime(data["birthday"]);
    // city = data["city"];
    // isPrivate = data["isPrivate"];
    // rating = data["rating"].toDouble();
    // status = data["status"];
    // subscription = data["subscription"];
    // premiumTicket = data["premiumTicket"];
  }
}
