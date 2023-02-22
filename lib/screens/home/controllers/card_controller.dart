import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:thomapps/screens/home/models/items_card.dart';

class CardController extends ChangeNotifier{
  List<ItemsCard>? items = [
    ItemsCard(id: 0, color: Colors.amber,title: 'Bicycle', icon: Icon(Icons.directions_bike)),
    ItemsCard(id: 1,color:Colors.pink[300],title:'Boat', icon: Icon(Icons.directions_boat)),
    ItemsCard(id: 2,color:Colors.pink[300],title: 'Bus', icon: Icon(Icons.directions_bus)),
    ItemsCard(id: 3,color:Colors.pink[300],title: 'Train', icon: Icon(Icons.directions_railway)),
    ItemsCard(id: 4,color:Colors.pink[300],title: 'Walk', icon: Icon(Icons.directions_walk)),
    ItemsCard(id: 5,color:Colors.pink[300],title: 'Contact', icon: Icon(Icons.contact_mail)),
    ItemsCard(id: 6,color:Colors.green,title: 'Bicycle', icon: Icon(Icons.directions_bike)),
    ItemsCard(id: 7,color:Colors.pink[300],title:'Boat', icon: Icon(Icons.directions_boat)),
    ItemsCard(id: 8,color:Colors.pink[300],title: 'Bus', icon: Icon(Icons.directions_bus)),
    ItemsCard(id: 9,color:Colors.pink[300],title: 'Train', icon: Icon(Icons.directions_railway)),
    ItemsCard(id: 10,color:Colors.pink[300],title: 'Walk', icon: Icon(Icons.directions_walk)),
    ItemsCard(id: 11,color:Colors.pink[300],title: 'Contact', icon: Icon(Icons.contact_mail)),
    ItemsCard(id: 12,color:Colors.green,title: 'Bicycle', icon: Icon(Icons.directions_bike)),
    ItemsCard(id: 13,color:Colors.pink[300],title:'Boat', icon: Icon(Icons.directions_boat)),
    ItemsCard(id: 14,color:Colors.pink[300],title: 'Bus', icon: Icon(Icons.directions_bus)),
    ItemsCard(id: 15,color:Colors.pink[300],title: 'Train', icon: Icon(Icons.directions_railway)),
    ItemsCard(id: 16,color:Colors.pink[300],title: 'Walk', icon: Icon(Icons.directions_walk)),
    ItemsCard(id: 17,color:Colors.pink[300],title: 'Contact', icon: Icon(Icons.contact_mail)),
  ];
}