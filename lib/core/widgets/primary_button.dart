import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';

/// Reusable filled button matching the app's auth UI.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.height,
    this.borderRadius,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? height;
  final double? borderRadius;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final effectiveHeight = height ?? 52.h;
    final effectiveRadius = borderRadius ?? 30.r;
    final effectiveBackground = backgroundColor ?? AppColors.buttonBlue;
    final effectiveTextColor = textColor ?? AppColors.white;

    return SizedBox(
      height: effectiveHeight,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: effectiveBackground,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(effectiveRadius),
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 20.w,
                height: 20.w,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(effectiveTextColor),
                ),
              )
            : Text(
                label,
                style: TextStyle(
                  fontFamily: AppFonts.satoshi,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: effectiveTextColor,
                ),
              ),
      ),
    );
  }
}

