import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thomapps/routes/app_pages.dart';

import 'package:thomapps/screens/auths/controllers/auth_controllers.dart';
import 'package:thomapps/widgets_accessories/image_loader_widget.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  AuthController authController = AuthController();
  FirebaseAuth auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return  Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              GestureDetector(
                onTap: ()=> Get.toNamed(Routes.PROFILE),
                child: UserAccountsDrawerHeader(
                  accountName: Text("Name"),
                  accountEmail: Text("Email"),
                  // currentAccountPicture: ImageLoaderWidget(url: authController.userImageFile.toString(), isCircular: true),
                  currentAccountPicture: Image.asset('assets/images/birdy.png'),
                ),
              ),
              ListTile(
                title: Text("Version alpha 0.0.1"),
                onTap: () {
                  Get.defaultDialog(
                      title: "Version alpha 0.0.1",
                      middleText: "Mon app de widgets, Thomas ORTA",
                  );
                },
              ),
              Divider(
                thickness: 3,
              ),
              ListTile(
                leading: Icon(Icons.workspace_premium),
                title: Text("Acces Premium"),
                onTap: () {
                  // Get.toNamed(Routes.PREMIUM);
                },
              ),
              Divider(
                thickness: 3,
              ),
              ListTile(
                title: Text('Boîte à idée'),
                leading: Icon(Icons.lightbulb),
                onTap: () {
                  Get.defaultDialog(
                    title: "La boîte à idée",
                    middleText: "Dîtes-moi quelles améliorations et fonctions vous aimeriez voir apparaître. \n\n N'hésitez pas à me laisser un message directement via le formulaire de contact. \n\n Merci encore pour votre soutien ! :-)"
                  );
                },
              ),
              ListTile(
                title: Text('Contact'),
                leading: Icon(Icons.email),
                onTap: () {
                  Get.toNamed(Routes.CONTACT);
                },
              ),
              Divider(
                thickness: 3,
              ),
              Divider(
                thickness: 3,
              ),
              ListTile(
                title: Text('Fermer le menu'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )
     
    );
  }
}
