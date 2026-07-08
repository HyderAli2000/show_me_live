import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/features/onboarding/models/onboarding_item.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.item});

  final OnboardingItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          100.h.verticalSpace,
          ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(item.image, fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 32.h),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: AppFonts.tactic,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
              height: 1.15,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            item.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: AppFonts.satoshi,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.white.withValues(alpha: 0.45),
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}
