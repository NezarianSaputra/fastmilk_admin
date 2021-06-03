import 'package:flutter/material.dart';

import 'constants.dart';

// data theme
ThemeData theme() {
  return ThemeData(
    primaryColor: Color(0xFFFE931D),
    appBarTheme: appBarTheme(),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "ABeeZee",
    inputDecorationTheme: inputDecorationTheme(),
  );
}

// input decoration theme
InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    gapPadding: 10,
  );
  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 20),
  );
}

//text theme
TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

//app bar theme
AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Color(0xFF757575),
        fontSize: 18,
      ),
    ),
  );
}
