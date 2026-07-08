import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_icons.dart';
import 'package:show_me_live/core/theme/assets_images.dart';
import 'package:show_me_live/core/widgets/app_background.dart';
import 'package:show_me_live/core/widgets/app_text_field.dart';
import 'package:show_me_live/core/widgets/mobile_home_indicator.dart';
import 'package:show_me_live/core/widgets/primary_button.dart';
import 'package:show_me_live/features/auth/screens/login_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  Widget _lockPrefixIcon() {
    return Container(
      width: 22.w,
      height: 22.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.white.withValues(alpha: 0.35)),
      ),
      child: Center(
        child: Image.asset(
          AssetIcons.lock,
          width: 12.w,
          height: 12.w,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            margin: EdgeInsets.only(left: 20.w),
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 18.w,
              color: AppColors.darkBlue,
            ),
          ),
        ),
      ),
      body: AppBackground(
        blurBackground: false,
        child: SafeArea(
          bottom: true,
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  AssetImages.logo,
                  width: 270.w,
                  height: 120.h,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 18.h),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Container(
                    height: 0.6.sh,
                    padding: EdgeInsets.fromLTRB(20.w, 26.h, 20.w, 30.h),
                    decoration: BoxDecoration(
                      color: const Color(0xff03031F),
                      borderRadius: BorderRadius.circular(26.r),
                      border: Border.all(color: AppColors.darkBlue),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Reset Password',
                          style: TextStyle(
                            fontFamily: AppFonts.tactic,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Set new password',
                          style: TextStyle(
                            fontFamily: AppFonts.satoshi,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white.withValues(alpha: 0.55),
                            height: 1.35,
                          ),
                        ),
                        SizedBox(height: 18.h),
                        AppTextField(
                          hintText: 'New Password',
                          enablePasswordToggle: true,
                          prefixIconAsset: AssetIcons.lock,
                          fillColor: AppColors.darkBlue.withValues(alpha: 0.15),
                          borderColor: Colors.white.withValues(alpha: 0.55),
                        ),
                        SizedBox(height: 14.h),
                        AppTextField(
                          hintText: 'Confirm New Password',
                          enablePasswordToggle: true,
                          prefixIconAsset: AssetIcons.lock,
                          fillColor: AppColors.darkBlue.withValues(alpha: 0.15),
                          borderColor: Colors.white.withValues(alpha: 0.55),
                        ),
                        SizedBox(height: 18.h),
                        PrimaryButton(
                          label: 'Reset Now',
                          onPressed: () {
                            Get.offAll(() => LoginScreen());
                          },
                          backgroundColor: AppColors.buttonBlue,
                          height: 52.h,
                          borderRadius: 30.r,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
