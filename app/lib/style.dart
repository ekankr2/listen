import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

ThemeData mainTheme = ThemeData(
    fontFamily: 'Pretendard',
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16.0),
      bodyMedium: TextStyle(fontSize: 14.0),
      titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      foregroundColor: Colors.black,
    )),
    appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 1,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
        actionsIconTheme: IconThemeData(color: Colors.black)),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(selectedItemColor: Colors.black
            // surfaceTintColor: Colors.white
            ));

final CupertinoThemeData mainCupertinoTheme = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: CupertinoColors.black,
  primaryContrastingColor: CupertinoColors.white,
  textTheme: CupertinoTextThemeData(
    textStyle: TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 16.0,
      color: CupertinoColors.black,
    ),
    navTitleTextStyle: TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color: CupertinoColors.black,
    ),
    navLargeTitleTextStyle: TextStyle(
      fontFamily: 'Pretendard',
      fontSize: 25.0,
      fontWeight: FontWeight.w700,
      color: CupertinoColors.black,
    ),
  ),
  barBackgroundColor: CupertinoColors.white,
);
