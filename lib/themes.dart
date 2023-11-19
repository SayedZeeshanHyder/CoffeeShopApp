import 'package:flutter/material.dart';

final lighttheme = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor: Colors.brown,foregroundColor: Colors.white),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),

  iconTheme: const IconThemeData(
    color: Colors.brown
  ),

  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    actionsIconTheme: IconThemeData(
      color: Colors.white,
    ),
    backgroundColor: Colors.brown,
    titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),
  ),

  inputDecorationTheme: const InputDecorationTheme(
    prefixIconColor: Colors.brown
  ),

  snackBarTheme: const SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    actionBackgroundColor: Colors.brown,
    actionTextColor: Colors.white
  ),

  textTheme: const TextTheme(
    displayMedium: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.w600,),
    displayLarge: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,),
    displaySmall: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w400,),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.brown,
    foregroundColor: Colors.white
  ),
);