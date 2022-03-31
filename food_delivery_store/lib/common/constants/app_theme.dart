import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_images.dart';

ThemeData appLightTheme() {
  return ThemeData(

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(color: Colors.white),
      unselectedIconTheme: IconThemeData(color: Colors.white54),
      selectedLabelStyle: TextStyle(fontSize: 0),
      unselectedLabelStyle: TextStyle(fontSize: 0),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.colorDarkPink,
    ),

    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );
}