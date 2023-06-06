import 'package:flutter/material.dart';

TextStyle headstyle = TextStyle(
  color: Colors.transparent,
  fontSize: 20,
  fontWeight: FontWeight.bold,
  decoration: TextDecoration.underline,
  decorationStyle: TextDecorationStyle.solid,
  decorationColor: Colors.pink.shade900,
  decorationThickness: 3,
  shadows: [Shadow(color: Colors.red.shade900, offset: Offset(0, -8))],
);

TextStyle hintstyle =
    TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);

TextStyle greenstyle = TextStyle(
    color: Colors.green.shade500, fontSize: 18, fontWeight: FontWeight.bold);
TextStyle citydaystyle=TextStyle(
  color: Colors.black,
  fontSize: 25,
  fontWeight: FontWeight.bold
);
TextStyle citynightstyle=TextStyle(
    color: Colors.green,
    fontSize: 25,
    fontWeight: FontWeight.bold
);