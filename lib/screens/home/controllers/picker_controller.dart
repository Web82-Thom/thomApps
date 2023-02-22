import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:thomapps/ressources/constants/null_safety.dart';
import 'package:thomapps/screens/auths/controllers/auth_controllers.dart';
import 'package:uuid/uuid.dart';

class PickerController extends ChangeNotifier {
  String imagePath = "";
  String imageSize = "";
  String imageURL = "";

  AuthController authController = AuthController();

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  bool isPictureSent = false;

  void getImage(ImageSource imageSource) async {

    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      imagePath = pickedFile.path;
      imageSize = ((File(imagePath)).lengthSync()/1024/1024).toStringAsFixed(2)+"Mb";
    } else {
      Get.snackbar("Error", "You have selected no Image",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.purple,
          colorText: Colors.white);
    }
  }

  /// uploadType: 0 = userImage / 1 = eventImage / 2 = tribeImage
  /// filename = objects/objectName-objectId / example : users/LordAres-434DFDF3DFD3D // objects may be "users", "events" or "tribes"
  Future<void> uploadFile({required String filePath, required String fileName, String? docId}) async {
    File file = File(filePath);
    try {
      await storage.ref(fileName).putFile(file)
        .whenComplete((){
          FirebaseFirestore.instance.collection("user_image")
            .doc(docId)
            .update({'url': fileName});
          isPictureSent = true;
        });
      } on firebase_core.FirebaseException catch (e) {
        print(e);
      }
    }

  ///====== ON SEND IMAGE WITH WEB ===================

  RxString filePathWeb = "".obs;
  final box = GetStorage();

  Future getImageWeb({
    required int uploadType,
    required String boxKeyurl,
  }) async {
    ImagePicker _picker = ImagePicker();

    await _picker.pickImage(source: ImageSource.gallery).then((xFile) {
      if (xFile != null) {
        uploadFileWeb(
            imageFile: xFile,
          boxKeyUrl: boxKeyurl,
          uploadType: uploadType,
            );
      }
    });
  }

  Future uploadFileWeb({
    required XFile imageFile,
    required int uploadType,
    required String boxKeyUrl,
  }) async {
    String fileName = const Uuid().v1();
    int status = 1;

    final metadata = SettableMetadata(
        contentType: "image/jpeg",
        customMetadata: {"picked-file-path": imageFile.path});

    String storagePath({
      required int uploadType,
    }){
      if(uploadType == 0) {
        return "users/";
      } else if (uploadType == 1) {
        return "events/";
      } else if (uploadType == 2) {
        return "tribes/";
      } else {
        return "others/";
      }
    }

    box.write(boxKeyUrl, "${storagePath(uploadType: uploadType)}$fileName");
    var ref = FirebaseStorage.instance.ref(storagePath(uploadType: uploadType)).child(fileName);

    TaskSnapshot snapshot;

    snapshot = await ref
        .putData(await imageFile.readAsBytes(), metadata);
  }

  String getFilePathWeb({String? filePath, int? uploadType}) {
    if(uploadType == 0) {
      return filePathWeb.value = filePath ?? "users/profile.png";
    } else if (uploadType == 1) {
      return filePathWeb.value = filePath ?? "events/question-mark.jpg";
    } else {
      return filePathWeb.value = "no-image.jpg";
    }
  }

  /// ================================================

  Future<firebase_storage.ListResult> listFiles() async {
    firebase_storage.ListResult results = await storage.ref("user_image").listAll();
    results.items.forEach((firebase_storage.Reference ref) {
      print("Found file: $ref");
    });
    return results;
  }

  Future<String> downloadURL(String imageURL) async {
    String downloadURL =  await storage.ref('user_image').getDownloadURL();
    if(downloadURL != null) {
      return downloadURL;
    } else {
      downloadURL = await storage.ref(noPictureEvent).getDownloadURL();
      return downloadURL;
    }

  }

  ageCalculator(DateTime date){
    DateTime birthday = date;
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthday.year;
    int month1 = currentDate.month;
    int month2 = birthday.month;

    if(month2 > month1){
      age--;
    } else if (month1 == month2){
      int day1 = currentDate.day;
      int day2 = birthday.day;
      if(day2 > day1) {
        age--;
      }
    }
    return age;
  }
}
