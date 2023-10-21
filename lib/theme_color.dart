import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();


  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.green,
    brightness: Brightness.light,

    appBarTheme: const AppBarTheme(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
  );


  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.yellow,
    brightness: Brightness.dark,

    appBarTheme: const AppBarTheme(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
  );
}
