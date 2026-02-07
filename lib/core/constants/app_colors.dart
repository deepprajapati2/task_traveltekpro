import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryBlue = Color(0xFF2C7AD6);
  static const Color primaryIndigo = Color(0xFF5636D1);
  static const Color primaryPurple = Color(0xFF6A3FD3);
  static const Color accentPink = Color(0xFFE45A7D);
  static const Color lightBackground = Color(0xFFF7F8FC);
  static const Color cardBorder = Color(0xFFE6E8F0);
  static const Color textDark = Color(0xFF1E1F24);
  static const Color textMuted = Color(0xFF7A7F8A);
  static const Color chipBlue = Color(0xFF3D64FF);
  static const Color successGreen = Color(0xFF29C16E);
  static const Color shadow = Color(0x1A0E1A2B);
  static const Color white = Colors.white;

  static const LinearGradient splashGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF2A79D8),
      Color(0xFF5D3FD6),
    ],
  );

  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF22B3D6),
      Color(0xFF5B3ED6),
    ],
  );
}
