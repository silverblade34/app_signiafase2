import 'package:flutter/material.dart';

class AppFonts {
  static const String fontFamily = 'Poppins';

  static const TextStyle heading1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 56, 56, 56),
  );

  static const TextStyle heading2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle bodyText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static const TextStyle labelForm = TextStyle(
    fontFamily: fontFamily,
    fontSize: 17,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  static const TextStyle titleAppBar = TextStyle(
    fontFamily: fontFamily,
    fontSize: 23,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}