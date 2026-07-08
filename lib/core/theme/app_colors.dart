import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color primaryBlue = Color(0xFF2F80FF);
  static const Color darkBlue = Color(0xFF1301FC);
  static const Color inactiveDot = Color(0xFFAAAAAA);
  static const Color backgroundDark = Color(0xFF0B1220);
  static const Color backgroundPurple = Color(0xFF1A1035);

  // Auth UI (inputs/buttons) colors tuned to match your screenshots.
  static const Color inputFill = Color(0xFF101A33);
  static const Color inputBorder = Color(0xFF203055);
  static const Color hintText = Color(0x99FFFFFF); // ~60% opacity
  static const Color buttonBlue = Color(0xFF2A2BFF);
  static const Color googleRed = Color(0xFFDB4437);
  static const Color appleGray = Color(0xFF3A3A3A);
  static const Color divider = Color(0x33FFFFFF);
  static const Color textDim = Color(0xCCFFFFFF);

  // Home shell / bottom navigation
  static const Color bottomNavBarBg = Color(0xFF32528D);
  static const Color bottomNavBarBg2 = Color(0xFF426FBD);
  static const Color bottomNavSelectedGlow = Color(0xFF396DC3);
  static const Color bottomNavInactive = Color(0xFF9FB5DA);
  static const Color fabGradientStart = Color(0xFFFFFFFF);
  static const Color fabGradientEnd = Color(0xFF1301FC);

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [backgroundDark, backgroundPurple],
  );
}
