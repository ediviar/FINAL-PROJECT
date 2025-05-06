import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xff007D3C),
    surfaceTintColor: Colors.blue[600],
    centerTitle: false,
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(Colors.grey[500]),
    trackColor: WidgetStateProperty.all(Colors.grey[300]),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey[200],
    selectedIconTheme: const IconThemeData(
      color: Colors.blue,
    ),
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey[700],
    unselectedIconTheme: IconThemeData(
      color: Colors.grey[700],
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Colors.grey[800],
    contentTextStyle: const TextStyle(color: Colors.white),
  ),
);

final darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[950],
    surfaceTintColor: Colors.black,
    centerTitle: false,
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.grey[900],
  cardTheme: CardTheme(
    color: Colors.grey[800],
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
    bodySmall: TextStyle(color: Colors.white),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(Colors.white),
    trackColor: WidgetStateProperty.all(Colors.grey),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey[800],
    selectedIconTheme: const IconThemeData(
      color: Colors.white,
    ),
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey[900],
    unselectedIconTheme: IconThemeData(
      color: Colors.grey[900],
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Colors.grey[700],
    contentTextStyle: const TextStyle(color: Colors.white),
  ),
);