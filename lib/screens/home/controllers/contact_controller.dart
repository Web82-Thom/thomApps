import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thomapps/routes/app_pages.dart';
import 'package:thomapps/screens/home/models/contact.dart';

class ContactController extends GetxController {
  //TODO: Implement ContactController

  CollectionReference contactCollection = FirebaseFirestore.instance.collection("contact");

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void sendContactForm({
     required String authorId,
    required String authorName,
    required String authorEmail,
    required String content,
    required DateTime createdAt,
}){
    try {
      contactCollection
          .add(Contact(
        authorId: authorId,
        authorName: authorName,
        authorEmail: authorEmail,
        content: content,
        createdAt: createdAt,
      ).toMap())
          .whenComplete(() {
        Get.snackbar("SUCCESS",
            "Votre message a bien été envoyé. Je vous reconctacterais prochainement.",
        snackPosition: SnackPosition.BOTTOM);
        Get.toNamed(Routes.HOME);
      });
    }  catch (e) {
    print(e);
    }
  }
}
