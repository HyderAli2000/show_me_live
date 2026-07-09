import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_icons.dart';
import 'package:show_me_live/core/theme/assets_images.dart';
import 'package:show_me_live/core/widgets/app_text_field.dart';
import 'package:show_me_live/core/widgets/app_top_bar.dart';
import 'package:show_me_live/core/widgets/primary_button.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  void _showSuccessBanner() {
    Get.dialog(
      const _PasswordChangedBanner(),
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.55),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: const AppTopBar(title: 'Change Password'),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetImages.allBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(18.w, 16.h, 18.w, 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _LabeledPasswordField(
                        label: 'Existing Password',
                        hintText: 'Enter your existing password',
                      ),
                      SizedBox(height: 18.h),
                      const _LabeledPasswordField(
                        label: 'New Password',
                        hintText: 'Create a new password',
                        helperText: 'Must be at least 8 characters',
                      ),
                      SizedBox(height: 18.h),
                      const _LabeledPasswordField(
                        label: 'Confirm Password',
                        hintText: 'Confirm your new password',
                        helperText: 'Must be at least 8 characters',
                      ),
                      SizedBox(height: 22.h),
                      const _PasswordRequirementsBox(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 20.h),
                child: PrimaryButton(
                  label: 'Reset Password',
                  onPressed: _showSuccessBanner,
                  height: 52.h,
                  borderRadius: 30.r,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LabeledPasswordField extends StatelessWidget {
  const _LabeledPasswordField({
    required this.label,
    required this.hintText,
    this.helperText,
  });

  final String label;
  final String hintText;
  final String? helperText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: AppFonts.satoshi,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.white.withValues(alpha: 0.75),
          ),
        ),
        SizedBox(height: 8.h),
        AppTextField(
          hintText: hintText,
          enablePasswordToggle: true,
          prefixIconAsset: AssetIcons.lock,
          fillColor: AppColors.darkBlue.withValues(alpha: 0.18),
          borderColor: Colors.white.withValues(alpha: 0.55),
        ),
        if (helperText != null) ...[
          SizedBox(height: 6.h),
          Text(
            helperText!,
            style: TextStyle(
              fontFamily: AppFonts.satoshi,
              fontSize: 12.sp,
              color: AppColors.white.withValues(alpha: 0.45),
            ),
          ),
        ],
      ],
    );
  }
}

class _PasswordRequirementsBox extends StatelessWidget {
  const _PasswordRequirementsBox();

  static const _requirements = [
    'At least 8 characters',
    'Mix of letters and numbers',
    'At least one special character',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.darkBlue.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password must contain:',
            style: TextStyle(
              fontFamily: AppFonts.satoshi,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.white.withValues(alpha: 0.85),
            ),
          ),
          SizedBox(height: 10.h),
          ..._requirements.map(
            (item) => Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '• ',
                    style: TextStyle(
                      fontFamily: AppFonts.satoshi,
                      fontSize: 14.sp,
                      color: AppColors.white.withValues(alpha: 0.65),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item,
                      style: TextStyle(
                        fontFamily: AppFonts.satoshi,
                        fontSize: 13.sp,
                        color: AppColors.white.withValues(alpha: 0.65),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PasswordChangedBanner extends StatelessWidget {
  const _PasswordChangedBanner();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.fromLTRB(18.w, 56.h, 18.w, 0),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 18.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF0E0A3A),
                  AppColors.backgroundDark.withValues(alpha: 0.98),
                ],
              ),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: AppColors.primaryBlue.withValues(alpha: 0.35),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.buttonBlue.withValues(alpha: 0.25),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 42.w,
                      height: 42.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primaryBlue.withValues(alpha: 0.6),
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          AssetIcons.lock,
                          width: 18.w,
                          height: 18.w,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        'Your password has been changed successfully. You can now login with your new password.',
                        style: TextStyle(
                          fontFamily: AppFonts.satoshi,
                          fontSize: 13.sp,
                          height: 1.45,
                          color: AppColors.white.withValues(alpha: 0.8),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                PrimaryButton(
                  label: 'Go Back',
                  onPressed: () {
                    Get.back();
                    Get.back();
                  },
                  height: 44.h,
                  borderRadius: 30.r,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
