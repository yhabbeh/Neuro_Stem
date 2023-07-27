import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ResponsiveUI{
  static double? screenWidth;
  static double? screenHeight;

  static void getScreenDimensions(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    screenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
  }
  static onGenerateRoute(RouteSettings routeSettings ,Widget page) {
    return MaterialPageRoute(
      builder: (context) {
        getScreenDimensions(context);
        return page;
      },
      settings: routeSettings,
    );
  }

  static bool isTablet(){
    final bool isTablet;
    final double devicePixelRatio = ui.window.devicePixelRatio;
    final ui.Size size = ui.window.physicalSize;
    final double width = size.width;
    final double height = size.height;

    if((devicePixelRatio == 2 || devicePixelRatio < 2) && (width >= 1200 || height >= 1920)) {
      isTablet = true;
    }
    else {
      isTablet = false;
    }
    return isTablet;
  }
}