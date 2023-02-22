import 'dart:math';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:thomapps/ressources/constants/colors.dart';
import 'package:thomapps/ressources/constants/sizes.dart';
import 'package:thomapps/ressources/constants/styles.dart';
import 'package:thomapps/routes/app_pages.dart';
import 'package:thomapps/screens/home/controllers/card_controller.dart';
import 'package:thomapps/screens/home/models/items_card.dart';

class CardHome extends StatefulWidget {
  const CardHome({super.key});

  @override
  _CardHomeState createState() => _CardHomeState();
}

Color selected = Colors.orange;
CardController cardController = CardController();

class _CardHomeState extends State<CardHome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: (2 / 1),
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        //physics:BouncingScrollPhysics(),
        padding: EdgeInsets.all(5.0),
        children: cardController.items!
            .map(
              (data) => GestureDetector(
                  onTap: () {
                    // Navigator.of(context).pushNamed(RouteName.GridViewBuilder);
                    print(data.id);
                  },
                  child: Container(
                    width: 150,
                    padding: const EdgeInsets.all(8),
    
                    //  margin:EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    color:data.color,
                    // color: RandomColorModel().getColor(),
                    child: Column(
                      children: [
                        Text(data.id.toString()),
                        data.icon as Icon,
                        Expanded(
                          child: Text(data.title.toString(),
                              style: TextStyle(fontSize: 18, color: Colors.black),
                              textAlign: TextAlign.center),
                        )
                      ],
                    ),
                  )),
            )
            .toList(),
      ),
    );
  }
}

class RandomColorModel {
  Random random = Random();
  Color getColor() {
    return Color.fromARGB(random.nextInt(300), random.nextInt(300),
        random.nextInt(300), random.nextInt(300));
  }
}
