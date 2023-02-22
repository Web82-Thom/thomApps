import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thomapps/ressources/constants/sizes.dart';
import 'package:thomapps/ressources/constants/texts.dart';
import 'package:thomapps/screens/auths/controllers/auth_controllers.dart';
import 'package:thomapps/screens/home/controllers/contact_controller.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  ContactController contactController = Get.put(ContactController());
  AuthController authController = AuthController();

  TextEditingController _contentField = TextEditingController();

  Color _color1 = Color(0xFF005288);
  Color _color2 = Color(0xFF37474f);
  Color _color3 = Color(0xFF78909c);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(normalGap),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(contactPageFeaturing, textAlign: TextAlign.center,),
                SizedBox(
                  height: normalGap,
                ),
                TextField(
                  controller: _contentField,
                  maxLines: 10,
                  style: TextStyle(color: _color2),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: _color1, width: 1.0)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: contactPageTextField,
                      labelStyle: TextStyle(
                          fontSize: 12, color: _color3
                      )
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) => _color1,
                        ),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0),
                            )
                        ),
                      ),
                      onPressed: () {
                        // contactController.sendContactForm(authorId: authController.tempUser["id"], authorName: authController.tempUser["username"], authorEmail: authController.tempUser["email"], content: _contentField.text, createdAt: DateTime.now());
                        contactController.sendContactForm(authorId: "0", authorName: "moi", authorEmail: "thom.orta@gmail.com", content: _contentField.text, createdAt: DateTime.now());
                        _contentField.clear();
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          buttonSubmitText,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
