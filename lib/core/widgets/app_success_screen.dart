import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_images.dart';
import 'package:show_me_live/core/widgets/primary_button.dart';

/// Reusable success / confirmation screen used across the app.
class AppSuccessScreen extends StatelessWidget {
  const AppSuccessScreen({
    super.key,
    required this.title,
    required this.description,
    this.linkText,
    this.icon,
    this.secondaryActionLabel,
    this.onSecondaryAction,
    required this.primaryActionLabel,
    required this.onPrimaryAction,
    this.backgroundImage = AssetImages.allBg,
  });

  final String title;
  final String description;
  final String? linkText;
  final Widget? icon;
  final String? secondaryActionLabel;
  final VoidCallback? onSecondaryAction;
  final String primaryActionLabel;
  final VoidCallback onPrimaryAction;
  final String backgroundImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        icon ?? const _DefaultSuccessIcon(),
                        SizedBox(height: 28.h),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppFonts.tactic,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(height: 14.h),
                        Text(
                          description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppFonts.satoshi,
                            fontSize: 14.sp,
                            height: 1.55,
                            color: AppColors.white.withValues(alpha: 0.65),
                          ),
                        ),
                        if (linkText != null) ...[
                          SizedBox(height: 18.h),
                          Text(
                            linkText!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppFonts.satoshi,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white.withValues(alpha: 0.85),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                if (secondaryActionLabel != null &&
                    onSecondaryAction != null) ...[
                  GestureDetector(
                    onTap: onSecondaryAction,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Text(
                        secondaryActionLabel!,
                        style: TextStyle(
                          fontFamily: AppFonts.satoshi,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white.withValues(alpha: 0.75),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                ],
                PrimaryButton(
                  label: primaryActionLabel,
                  onPressed: onPrimaryAction,
                  height: 52.h,
                  borderRadius: 30.r,
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DefaultSuccessIcon extends StatelessWidget {
  const _DefaultSuccessIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96.w,
      height: 96.w,
      decoration: const BoxDecoration(
        color: AppColors.buttonBlue,
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.check_rounded, color: AppColors.white, size: 48.sp),
    );
  }
}
