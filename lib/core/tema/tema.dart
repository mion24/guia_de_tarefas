import 'package:flutter/material.dart';

ThemeData temaLight() => ThemeData(
      primaryColor: Colors.amberAccent,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.amberAccent.shade400,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.amberAccent.shade400),
    );
