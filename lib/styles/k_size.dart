// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:finesse/utils/extension.dart';
import 'package:flutter/material.dart';

/*
Focus: To maintain app wide design consistency all
the sizes(height/width) that are used in this app should be declared 
using methods of this class.
*/

class KSize {
  static double getWidth(BuildContext context, width) {
    double _width = (((100 / 375) * width) / 100) * context.screenWidth;
    return _width;
  }

  static double getHeight(BuildContext context, height) {
    double _height = (((100 / 812) * height) / 100) * context.screenHeight;
    return _height;
  }
}
