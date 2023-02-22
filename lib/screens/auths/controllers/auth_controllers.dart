import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thomapps/routes/app_pages.dart';
import 'package:thomapps/screens/auths/models/user_model.dart';
import 'package:get/get.dart';

class AuthController extends ChangeNotifier {
  // FirebaseAuth auth = FirebaseAuth.instance;

  var isLogin = true;

  // User? user;
  // Timer? timer;

  // final storage = FirebaseStorage.instance;
  // CollectionReference usersCollection = FirebaseFirestore.instance.collection("users");
  // final ref = FirebaseStorage.instance.ref().child('user_image');
  bool isSignUp = false;

  String newUserEmail = "";
  String newUserPassword = "";
  String newUserUsername = "";
  File? userImageFile;
  // void pickedImage(File image) {
  //   userImageFile = image;
  // }

  // var tempUser = {};

  // Future userSignUp({
  //   required String name,
  //   required String email,
  //   required String password,
  //   required File userImageUrl,
  // }) async {
  //   UserCredential? authResult;
  //   try {
  //     print("in function userSignUp");
  //     print('userSignUp ' + name);
  //     print('userSignUp ' + email.toString());
  //     print('userSignUp ' + password.toString());
  //     print('userSignUp ' + userImageFile.toString());
  //     print(isLogin);

  //     if (userImageFile == null && !isLogin) {
  //       Get.snackbar(
  //         "Attention",
  //         "Veuillez prendre une photo !",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.grey[500],
  //         duration: Duration(seconds: 3),
  //       );
  //     } else {
  //        await auth
  //           .createUserWithEmailAndPassword(
  //         email: email,
  //         password: password,
  //       ).whenComplete(() async{
  //           userCreateProfile(username: name, email: email, url: userImageFile);
  //           final ref =FirebaseStorage.instance
  //           .ref()
  //           .child('user_image');

  //       UploadTask uploadTask = ref.child(authResult!.user!.uid + '.jpg').putFile(userImageUrl);
  //       final imageUrl = await (await uploadTask).ref.getDownloadURL();
  //         },
  //       );

  //       // UploadTask uploadTask =
  //       //     ref.child(authResult.user!.uid + '.jpg').putFile(userImageFile!);
  //       // final imageUrl = await (await uploadTask).ref.getDownloadURL();
  //       // // final url =
  //       // // imageUrl.toString();
  //       // // print(url););
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       SnackBar(
  //           content: Text("ATTENTION"
  //               "Le mot de passe utilisé est trop faible ! Veuillez utiliser un mot de passe d'au moins 6 caractères."));
  //     } else if (e.code == 'email-already-in-use') {
  //       SnackBar(
  //           content: Text("ATTENTION"
  //               "Un compte a déjà été créé avec cet email. N'hésitez pas à utiliser le mot de passe oublié en cas de besoin."));
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // void getUserProfile({
  //   bool? isMoveScreen,
  // }) {
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(auth.currentUser?.uid)
  //       .get()
  //       .then((DocumentSnapshot documentSnapshot) {
  //     if (documentSnapshot.exists) {
  //       tempUser = documentSnapshot.data() as Map;
  //       print('Document ressources: ${documentSnapshot.data()}');
  //       print('tempUser ressources: $tempUser');

  //       if (!kIsWeb) {
  //         if (isMoveScreen == true) {
  //           if (tempUser["url"] == null) {
  //             // Navigator.pushNamed(context!, "/auth");
  //             Get.toNamed(Routes.AUTH);
  //           } else {
  //             // Navigator.pushNamed(context!, "/home");
  //             Get.toNamed(Routes.HOME);
  //           }
  //         } else {
  //           null;
  //         }
  //       }
  //     } else {
  //       print('Document does not exist on the database');
  //       return SnackBar(
  //           content: Text("ATTENTION"
  //               "Ce compte n'éxiste pas. Veuiller en créer un."));
  //     }
  //   });
  // }

  // void userSignIn({String? email, String? password}) async {
  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: email!, password: password!)
  //         .whenComplete(() {
  //       getUserProfile();
  //     });
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //     }
  //   }
  // }

  // void userCreateProfile({
  //   required username,
  //   required email,
  //   required url,
  // }) {
  //   usersCollection
  //       .doc(auth.currentUser!.uid)
  //       .set(
  //         UserModel(
  //           id: auth.currentUser!.uid,
  //           username: newUserUsername,
  //           email: newUserEmail,
  //           url: userImageFile.toString(),
  //         ).toMap(),
  //       )
  //       .whenComplete(() {
  //     print("User Added");
  //     getUserProfile();
  //     Get.toNamed(Routes.HOME);
  //     Get.snackbar(
  //       "Inscription réussie",
  //       "bienvenue sur Thom App's",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.grey[500],
  //     );
  //   }).catchError((error) => print("Failed to add user : $error"));
  // }

  // void userSignOut() async {
  //   await FirebaseAuth.instance.signOut().whenComplete(() {
  //     Get.toNamed(Routes.AUTH);
  //     Get.snackbar(
  //       "Déconnexion réussie",
  //       "Veuillez vous connecter à nouveau pour accéder à Thom app's !",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.grey[500],
  //     );
  //   });
  // }
  // //-----SEND EMAIL VALIDATOR-----//
  // // Future<void> checkEmailVerified()async{
  // //  final user = auth.currentUser;
  // //   await user!.reload();
  // //   if(user.emailVerified){
  // //     timer!.cancel();
  // //   }
  // // }

  // @override
  // void initState() {
  //   initState();
  // }

  // @override
  // void onReady() {
  //   onReady();
  // }

  // @override
  // void close() {
  //   close();
  // }
}
