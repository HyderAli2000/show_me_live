import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_images.dart';
import 'package:show_me_live/core/widgets/primary_button.dart';

/// Shared layout for permission request screens (location, notification, etc.).
class PermissionView extends StatelessWidget {
  const PermissionView({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.buttonLabel,
    required this.onAllow,
  });

  final IconData icon;
  final String title;
  final String description;
  final String buttonLabel;
  final VoidCallback onAllow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: PermissionGradientContainer(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 116.w,
                          height: 116.w,
                          decoration: const BoxDecoration(
                            color: AppColors.buttonBlue,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(icon, color: AppColors.white, size: 52.w),
                        ),
                        SizedBox(height: 26.h),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppFonts.arial,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(height: 14.h),
                        Text(
                          description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppFonts.arial,
                            fontSize: 14.sp,
                            height: 1.5,
                            color: AppColors.white.withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: PrimaryButton(
                  label: buttonLabel,
                  onPressed: onAllow,
                  backgroundColor: AppColors.buttonBlue,
                  height: 54.h,
                  borderRadius: 30.r,
                ),
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

class PermissionGradientContainer extends StatelessWidget {
  const PermissionGradientContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetImages.accBg),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
