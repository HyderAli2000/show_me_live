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
      textTheme: const TextTheme().apply(fontFamily: AppFonts.satoshi),
    );
  }

  /// Theme override for screens that use the Tactic display font.
  static ThemeData tacticTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      textTheme: Theme.of(context).textTheme.apply(fontFamily: AppFonts.tactic),
      primaryTextTheme:
          Theme.of(context).primaryTextTheme.apply(fontFamily: AppFonts.tactic),
      appBarTheme: Theme.of(context).appBarTheme.copyWith(
            titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                  fontFamily: AppFonts.tactic,
                ),
          ),
    );
  }
}
