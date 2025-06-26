import 'package:flutter/material.dart';

/// Colors
class AppColors {
  /// Background color for general surfaces (light gray)
  static const Color background = Color(0xFFF7F7F7);

  /// Primary text color (dark)
  static const Color text = Color(0xFF280609);

  /// Color for disabled or low-emphasis elements
  static const Color lowLight = Color(0xFFCBCBCB);

  /// Default filler color
  static const Color filler = Color(0xFFFFFFFF);

  /// Stronger filler color
  static Color fillerStrong = Colors.grey[300] ?? Colors.grey;

  /// Shadow color for elevation effects
  static const Color shadow = Color(0xFF363636);

  /// Low-emphasis text color (e.g. hints, helper text)
  static const Color lowText = Color(0xFF767676);

  /// Accent color (e.g. buttons, highlights, icons)
  static const Color accent = Color(0xFFFD1524);
}
