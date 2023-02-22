import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thomapps/ressources/constants/styles.dart';
import 'package:thomapps/routes/app_pages.dart';
import 'package:thomapps/screens/home/widgets/contact.dart';

class ContactView extends GetView {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Contact',
          style: whiteBoldText,),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: ()=> Get.toNamed(Routes.HOME),),
        ),
        body: Center(child: Contact()),
      ),
    );
  }
}
