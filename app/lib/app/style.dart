import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Voice-focused color palette
class VoiceColors {
  static const Color primary = Color(0xFF6C5CE7);        // Purple
  static const Color secondary = Color(0xFF00CEC9);      // Teal
  static const Color accent = Color(0xFFFF6B9D);         // Pink
  static const Color background = Color(0xFF1A1B23);     // Dark blue-grey
  static const Color surface = Color(0xFF25263D);        // Lighter dark
  static const Color cardBackground = Color(0xFF2D2E44); // Card background
  static const Color textPrimary = Color(0xFFFFFFFF);    // White
  static const Color textSecondary = Color(0xFFB8B9D1);  // Light grey
  static const Color success = Color(0xFF00D4AA);        // Green
  static const Color warning = Color(0xFFFFB800);        // Orange
  static const Color error = Color(0xFFFF5C5C);          // Red
  static const Color micActive = Color(0xFF74B9FF);      // Light blue
  static const Color waveform = Color(0xFF81ECEC);       // Cyan
}

final CupertinoThemeData mainCupertinoTheme = CupertinoThemeData(
  brightness: Brightness.dark,
  primaryColor: VoiceColors.primary,
  primaryContrastingColor: VoiceColors.textPrimary,
  scaffoldBackgroundColor: VoiceColors.background,
  textTheme: CupertinoTextThemeData(
    textStyle: TextStyle(
      fontSize: 16.0,
      color: VoiceColors.textPrimary,
    ),
    navTitleTextStyle: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color: VoiceColors.textPrimary,
    ),
    navLargeTitleTextStyle: TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.w700,
      color: VoiceColors.textPrimary,
    ),
  ),
  barBackgroundColor: VoiceColors.surface,
);
