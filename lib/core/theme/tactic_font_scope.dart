import 'package:flutter/material.dart';

import 'app_theme.dart';

/// Applies the Tactic font to a single screen and its descendants.
///
/// Use this wrapper on the three screens that should use Tactic instead of
/// the app-wide Satoshi font.
class TacticFontScope extends StatelessWidget {
  const TacticFontScope({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.tacticTheme(context),
      child: child,
    );
  }
}
