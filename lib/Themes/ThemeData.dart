import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
      primaryColor: const Color(0xff6D7072),
      backgroundColor: Color(0xffFFFFFF),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w700,
          color: Color(0xffFFFFFF),
        ),
        bodyMedium: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: Color(0xffFFFFFF),
        ),
        bodySmall: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: Color(0xff6D7072),
        ),
      ));
}
