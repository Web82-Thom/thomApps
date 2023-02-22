import 'package:flutter/material.dart';

class MakeItResponsive {

  double minPoint = 640;
  double maxPoint = 1008;

  ScreenSize getScreenSize(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if(size.width > maxPoint) {
      return ScreenSize.large;
    } else if (size.width < minPoint) {
      return ScreenSize.small;
    } else {
      return ScreenSize.medium;
    }
}
}

enum ScreenSize {small, medium, large}