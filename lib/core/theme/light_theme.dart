import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_colors.dart';

class LightTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    primarySwatch: AppColors.getMaterialColor(AppColors.primaryColor),
    scaffoldBackgroundColor: Colors.white,
    unselectedWidgetColor: Colors.grey,

    //-------------- start app Bar theme ---------------//
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 30,
      ),
      titleTextStyle: TextStyle(
          fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
      actionsIconTheme: IconThemeData(
        color: Colors.black,
        size: 30,
      ),
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark),
    ),
    //--------------- End app bar theme ---------------//

    //--------------- Start input theme --------------//
    inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        suffixIconColor: Colors.grey,
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[300]!,
          ),
        ),
        fillColor: Colors.grey,
        hoverColor: Colors.grey,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(color: Colors.grey)),
        labelStyle: const TextStyle(color: Colors.grey, fontSize: 15),
        iconColor: Colors.grey,
        prefixIconColor: Colors.grey,
        hintStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400)),
    //--------------- End input theme ----------------//

    //--------------- Start Button Theme -------------//
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      height: 50,
      textTheme: ButtonTextTheme.primary,
    ),
    //--------------- End Button Theme --------------//

    //------------ Start text Theme ----------------//
    textTheme: const TextTheme(
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        titleSmall: TextStyle(
            fontSize: 22, color: Colors.black87, fontWeight: FontWeight.w800),
        titleMedium: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        displayLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
        displayMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w300,
          color: Colors.black87,
        ),
        bodySmall: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        )),
    //------------ end text Theme ------------------//

    //------------ Start Card Theme ------------------//
    cardColor: Colors.white,
    cardTheme: const CardTheme(
      elevation: 3,
      shadowColor: Colors.grey,
    ),
    //------------ End Card Theme -------------------//

    //------------ Start bottom Nav Theme ------------------//
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 5,
        selectedIconTheme: IconThemeData(
          color: AppColors.primaryColor,
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.grey,
        ),
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true),
    //------------ End bottom Nav Theme -------------------//
  );
}
