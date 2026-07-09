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
import 'package:show_me_live/features/auth/screens/login_screen.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  static const _email = 'emaily2023@gmail.com';
  static const _reasons = [
    'Privacy Concerns',
    'Switching to another service',
    'To many notifications',
    "I'm facing technical issues",
    'Other',
  ];

  int _selectedReason = 4;
  bool _showPasswordError = true;
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _onConfirm() {
    if (_passwordController.text.isEmpty) {
      setState(() => _showPasswordError = true);
      return;
    }

    Get.dialog(
      const _DeleteAccountDialog(),
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.55),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: const AppTopBar(title: 'Delete Account'),
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
                      _SectionBlock(
                        title: 'Delete your Account',
                        child: Text(
                          'Deleting your account is permanent and cannot be undone. All your data will be permanently removed.',
                          style: TextStyle(
                            fontFamily: AppFonts.satoshi,
                            fontSize: 13.sp,
                            height: 1.5,
                            color: AppColors.white.withValues(alpha: 0.6),
                          ),
                        ),
                      ),
                      SizedBox(height: 22.h),
                      _SectionBlock(
                        title: 'Reason Selection (Optional, for analytics)',
                        child: Column(
                          children: List.generate(_reasons.length, (index) {
                            final isSelected = _selectedReason == index;
                            return Padding(
                              padding: EdgeInsets.only(bottom: 14.h),
                              child: GestureDetector(
                                onTap: () =>
                                    setState(() => _selectedReason = index),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20.w,
                                      height: 20.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.white,
                                          width: 1.5,
                                        ),
                                      ),
                                      child: isSelected
                                          ? Center(
                                              child: Container(
                                                width: 10.w,
                                                height: 10.w,
                                                decoration: const BoxDecoration(
                                                  color: AppColors.buttonBlue,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                            )
                                          : null,
                                    ),
                                    SizedBox(width: 12.w),
                                    Expanded(
                                      child: Text(
                                        _reasons[index],
                                        style: TextStyle(
                                          fontFamily: AppFonts.satoshi,
                                          fontSize: 14.sp,
                                          color: AppColors.white.withValues(
                                            alpha: 0.85,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      if (_selectedReason == 4) ...[
                        Container(
                          height: 110.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.darkBlue.withValues(alpha: 0.18),
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.55),
                            ),
                          ),
                          child: TextField(
                            maxLines: 4,
                            cursorColor: AppColors.white,
                            style: TextStyle(
                              fontFamily: AppFonts.satoshi,
                              fontSize: 14.sp,
                              color: AppColors.white,
                            ),
                            decoration: InputDecoration(
                              isCollapsed: true,
                              border: InputBorder.none,
                              hintText: 'Type your reason here...',
                              hintStyle: TextStyle(
                                fontFamily: AppFonts.satoshi,
                                fontSize: 14.sp,
                                color: AppColors.white.withValues(alpha: 0.5),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 22.h),
                      ] else
                        SizedBox(height: 8.h),
                      _SectionBlock(
                        title: 'Security Confirmation',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'To confirm deletion, please enter your password for',
                              style: TextStyle(
                                fontFamily: AppFonts.satoshi,
                                fontSize: 13.sp,
                                height: 1.45,
                                color: AppColors.white.withValues(alpha: 0.6),
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              _email,
                              style: TextStyle(
                                fontFamily: AppFonts.satoshi,
                                fontSize: 13.sp,
                                color: AppColors.white.withValues(alpha: 0.45),
                              ),
                            ),
                            SizedBox(height: 14.h),
                            AppTextField(
                              controller: _passwordController,
                              hintText: 'Enter your Password',
                              enablePasswordToggle: true,
                              prefixIconAsset: AssetIcons.lock,
                              fillColor: AppColors.darkBlue.withValues(
                                alpha: 0.18,
                              ),
                              borderColor: Colors.white.withValues(alpha: 0.55),
                              onChanged: (_) {
                                if (_showPasswordError) {
                                  setState(() => _showPasswordError = false);
                                }
                              },
                            ),
                            if (_showPasswordError) ...[
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  Container(
                                    width: 16.w,
                                    height: 16.w,
                                    decoration: const BoxDecoration(
                                      color: AppColors.buttonBlue,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      color: AppColors.white,
                                      size: 11.w,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    'Incorrect password. Please try again',
                                    style: TextStyle(
                                      fontFamily: AppFonts.satoshi,
                                      fontSize: 12.sp,
                                      color: AppColors.white.withValues(
                                        alpha: 0.55,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 20.h),
                child: PrimaryButton(
                  label: 'Confirm',
                  onPressed: _onConfirm,
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

class _DeleteAccountDialog extends StatelessWidget {
  const _DeleteAccountDialog();

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
              'Delete Account',
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
              padding: EdgeInsets.all(22.w),
              decoration: const BoxDecoration(
                color: AppColors.buttonBlue,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                AssetIcons.dlt,
                fit: BoxFit.contain,
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 22.h),
            Text(
              'Are you sure you want to delete your account',
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

class _SectionBlock extends StatelessWidget {
  const _SectionBlock({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: AppFonts.satoshi,
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
        SizedBox(height: 10.h),
        child,
      ],
    );
  }
}
