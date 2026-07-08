import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(18.w, 8.h, 18.w, 120.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: TextStyle(
                fontFamily: AppFonts.tactic,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Home content goes here',
              style: TextStyle(
                fontFamily: AppFonts.satoshi,
                fontSize: 14.sp,
                color: AppColors.white.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: Container(
          width: 58.w,
          height: 58.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.fabGradientStart,
                AppColors.fabGradientStart,
                AppColors.fabGradientEnd,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.fabGradientStart.withValues(alpha: 0.45),
                blurRadius: 18,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Icon(
            Icons.add_rounded,
            color: AppColors.darkBlue,
            size: 30.sp,
          ),
        ),
      ),
    );
  }
}
