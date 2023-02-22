import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:thomapps/ressources/constants/colors.dart';
import 'package:thomapps/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:thomapps/screens/auths/views/auth_view.dart';
import 'package:thomapps/screens/home/widgets/card_home.dart';
import 'package:thomapps/widgets_accessories/custom_drawer.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thom App's"),
        actions: [
          DropdownButton(
            underline: Container(),
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                value: 'profil',
                child: Row(
                  children: const <Widget>[
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Profil'),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: 'logout',
                child: Row(
                  children: const <Widget>[
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Déconnexion'),
                  ],
                ),
              ),
            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'profil') {
                Get.toNamed(Routes.PROFILE);
                // authController.userSignOut();
              }
              else if (itemIdentifier == 'logout') {
                Get.toNamed(Routes.AUTH);
                // authController.userSignOut();
              }
            },
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: CardHome(),
    );
  }
}
