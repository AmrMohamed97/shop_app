import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightMode = ThemeData(
  primarySwatch: Colors.indigo,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    // titleTextStyle: TextStyle(),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor:Colors.white,
    selectedItemColor: Colors.indigo,
    unselectedItemColor: Colors.grey,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.indigo,
  ),
  textTheme:const TextTheme(
    bodyLarge:TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: Colors.black,
    ),
  ),
  fontFamily: 'Jannah',
);

ThemeData darkMode = ThemeData(
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
    titleSpacing: 20,
    backgroundColor: HexColor('333739'),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  primarySwatch: Colors.deepOrange,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: HexColor('333739'),
    selectedItemColor: Colors.indigo[300],
    unselectedItemColor: Colors.grey,
  ),
  textTheme: const TextTheme(
    bodyLarge:TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: Colors.white,
    ),
  ),
  fontFamily: 'Jannah',
);