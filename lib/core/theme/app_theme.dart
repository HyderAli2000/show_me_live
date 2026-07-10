import 'package:flutter/material.dart';

import 'app_fonts.dart';

abstract final class AppTheme {
  static ThemeData get light {
    return ThemeData(
      fontFamily: AppFonts.family,
      fontFamilyFallback: AppFonts.fallback,
      bottomSheetTheme: const BottomSheetThemeData(
        modalBackgroundColor: Colors.transparent,
        modalBarrierColor: Colors.transparent,
        modalElevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      appBarTheme: const AppBarTheme(surfaceTintColor: Colors.transparent),
      useMaterial3: true,
      textTheme: const TextTheme().apply(fontFamily: AppFonts.arial),
    );
  }
}
