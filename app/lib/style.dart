import 'package:flutter/cupertino.dart';

final CupertinoThemeData mainCupertinoTheme = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: CupertinoColors.black,
  primaryContrastingColor: CupertinoColors.white,
  textTheme: CupertinoTextThemeData(
    textStyle: TextStyle(
      fontSize: 16.0,
      color: CupertinoColors.black,
    ),
    navTitleTextStyle: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color: CupertinoColors.black,
    ),
    navLargeTitleTextStyle: TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.w700,
      color: CupertinoColors.black,
    ),
  ),
  barBackgroundColor: CupertinoColors.white,
);
