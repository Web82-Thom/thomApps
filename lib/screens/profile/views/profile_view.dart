import 'package:cloud_firestore_platform_interface/src/timestamp.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thomapps/ressources/constants/sizes.dart';
import 'package:thomapps/ressources/constants/styles.dart';
import 'package:thomapps/ressources/constants/texts.dart';
import 'package:thomapps/ressources/utils.dart';

import 'package:thomapps/ressources/widgets_general/dialog_cancel_button.dart';
import 'package:thomapps/ressources/widgets_general/dialog_confirm_button.dart';
import 'package:thomapps/screens/profile/widgets/custom_text_field.dart';
import 'package:thomapps/widgets_accessories/date_picker_widget2.dart';

import 'package:thomapps/widgets_accessories/image_loader_widget.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

Color _color1 = Color(0xFF07ac12);
Color _color2 = Color(0xff777777);
Color _color3 = Color(0xFF515151);

TextEditingController _usernameField = TextEditingController();
TextEditingController _emailField = TextEditingController();

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double profilePictureSize = MediaQuery.of(context).size.width / 3;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Mon profil"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                  width: profilePictureSize,
                  height: profilePictureSize,
                  child: GestureDetector(
                    onTap: () {
                      // _showPopupUpdatePicture();
                    },
                    child: Stack(
                      children: [
                        Image.asset("assets/images/birdy.png"),
                        // ImageLoaderWidget(
                        //     height: 150,
                        //     width: 150,
                        //     url: "assets/images/birdy.png",
                        //     isCircular: true),
                        // create edit icon in the picture
                        Container(
                          width: 30,
                          height: 30,
                          margin: EdgeInsets.only(
                              top: 0,
                              left: MediaQuery.of(context).size.width / 4),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 1,
                            child: Icon(Icons.edit, size: 12, color: _color3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   height40,
                    Text(
                      "Nom d'utilisateur",
                      style: TextStyle(
                        fontSize: 15,
                        color: _color2,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    height8,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "authController.tempUser['username']",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),

                        ///==========USERNAME
                        GestureDetector(
                          onTap: () {
                            Get.defaultDialog(
                              title: "Modifier le nom d'utilisateur",
                              content: CustomTextField(
                                  controller: _usernameField,
                                  labelText: "Nom d'utilisateur",
                                  isObscure: false),
                              cancel: DialogCancelButton(),
                              confirm: DialogConfirmButton(
                                onPressed: () {
                                  // profileController.updateUsername(
                                  //     id: authController.tempUser["id"],
                                  //     username: _usernameField.text);
                                  // _usernameField.clear();
                                  Navigator.pop(context);
                                },
                              ),
                            );
                          },
                          child: edit,
                        )
                      ],
                    ),
                    height24,
                    Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 15,
                          color: _color2,
                          fontWeight: FontWeight.normal),
                    ),
                   height8,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "authController.tempUser['email']",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),

                        ///=============EMAIL
                        GestureDetector(
                          onTap: () {
                            Get.defaultDialog(
                              title: "Modifier l'email",
                              content: CustomTextField(
                                  controller: _emailField,
                                  labelText: "Email",
                                  isObscure: false),
                              cancel: DialogCancelButton(),
                              confirm: DialogConfirmButton(
                                onPressed: () {
                                  // profileController.updateEmail(
                                  //     id: authController.tempUser["id"],
                                  //     email: _emailField.text);
                                  _emailField.clear();
                                  Navigator.pop(context);
                                },
                              ),
                            );
                          },
                          child: edit,
                        ),
                      ],
                    ),
                    height24,
                    Text(
                      "Ville d'habitation",
                      style: TextStyle(
                          fontSize: 15,
                          color: _color2,
                          fontWeight: FontWeight.normal),
                    ),
                    height8,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "authController.tempUser['city']",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    height24,
                    Text(
                      "Date de naissance",
                      style: TextStyle(
                          fontSize: 15,
                          color: _color2,
                          fontWeight: FontWeight.normal),
                    ),
                    height8,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            DateFormat('yMMMMEEEEd', 'fr_FR')
                                .format(Utils.toDateTime(Timestamp.now())!)
                                .toString(),
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),

                        ///=====================BIRTHDAY
                        GestureDetector(
                          onTap: () {
                            Get.defaultDialog(
                              title: "Modifier la date d'anniversaire",
                              content: FittedBox(
                                  child: DatePickerWidget(
                                      textWhenEmpty: "date d'anniversaire")),
                              cancel: DialogCancelButton(),
                              confirm: DialogConfirmButton(
                                onPressed: () {
                                  // profileController.updateBirthday(
                                  //     id: authController.tempUser["id"],
                                  //     birthday: box.read("selectedDate"));
                                  Navigator.pop(context);
                                },
                              ),
                            );
                          },
                          child: edit,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.defaultDialog(
                              title: "ATTENTION !",
                              middleText:
                                  "Toute suppression de compte est définitive. Souhaitez-vous supprimer votre compte ?",
                              cancel: DialogCancelButton(),
                              confirm: DialogConfirmButton(onPressed: () {
                                // authController.userDeleteAccount(
                                //   id: authController.tempUser["id"]);
                              }),
                            );
                          },
                          child: Text(
                            "Supprimer le compte",
                            style: whiteBoldText,
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
