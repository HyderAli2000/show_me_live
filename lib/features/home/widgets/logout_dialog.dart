import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/widgets/primary_button.dart';
import 'package:show_me_live/features/auth/screens/login_screen.dart';

void showLogoutDialog() {
  Get.dialog(
    const _LogoutDialog(),
    barrierDismissible: true,
    barrierColor: Colors.black.withValues(alpha: 0.55),
  );
}

class _LogoutDialog extends StatelessWidget {
  const _LogoutDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(22.w, 20.h, 22.w, 24.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF0E0A3A),
              AppColors.backgroundDark.withValues(alpha: 0.98),
            ],
          ),
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color: AppColors.primaryBlue.withValues(alpha: 0.25),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: Get.back,
                child: Icon(
                  Icons.close_rounded,
                  color: AppColors.white.withValues(alpha: 0.75),
                  size: 22.sp,
                ),
              ),
            ),
            Text(
              'Logout',
              style: TextStyle(
                fontFamily: AppFonts.tactic,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 24.h),
            Container(
              width: 88.w,
              height: 88.w,
              decoration: const BoxDecoration(
                color: AppColors.buttonBlue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.logout_rounded,
                color: AppColors.white,
                size: 40.sp,
              ),
            ),
            SizedBox(height: 22.h),
            Text(
              'Are you sure you want to logout your account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppFonts.satoshi,
                fontSize: 14.sp,
                height: 1.5,
                color: AppColors.white.withValues(alpha: 0.65),
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50.h,
                    child: OutlinedButton(
                      onPressed: Get.back,
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Colors.white.withValues(alpha: 0.55),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      child: Text(
                        'No',
                        style: TextStyle(
                          fontFamily: AppFonts.satoshi,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: PrimaryButton(
                    label: 'Yes',
                    onPressed: () {
                      Get.back();
                      Get.offAll(() => const LoginScreen());
                    },
                    height: 50.h,
                    borderRadius: 30.r,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
