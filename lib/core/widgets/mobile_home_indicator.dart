import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Small iOS-style home indicator bar (bottom center).
class MobileHomeIndicator extends StatelessWidget {
  const MobileHomeIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: 64.w,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.75),
        borderRadius: BorderRadius.circular(99),
      ),
    );
  }
}

