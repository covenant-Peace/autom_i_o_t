import 'package:flutter/material.dart';

class Constraint {
  double getHeight(BuildContext context, double height) {
    double geth;
    double screenHeight = MediaQuery.of(context).size.height;
    geth = height * screenHeight / 980;
    return geth;
  }

  double getWidth(BuildContext context, double width) {
    double getw;
    double screenHeight = MediaQuery.of(context).size.width;
    getw = width * screenHeight / 454;
    return getw;
  }
}
