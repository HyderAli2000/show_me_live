import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_images.dart';
import 'package:show_me_live/core/widgets/primary_button.dart';
import 'package:show_me_live/features/home/screens/account_settings_screen.dart';
import 'package:show_me_live/features/home/screens/edit_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const _name = 'William Roy';
  static const _email = 'william.roy@domain.com';
  static const _phone = '+1 234 567 890';
  static const _address =
      'Lorem ipsum dolor amet, consectetur adipiscing elit, eiusmod tempor...';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(18.w, 8.h, 18.w, 20.h),
            child: Column(
              children: [
                20.verticalSpace,
                Container(
                  width: 118.w,
                  height: 118.w,
                  padding: EdgeInsets.all(3.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [AppColors.primaryBlue, AppColors.fabGradientEnd],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryBlue.withValues(alpha: 0.35),
                        blurRadius: 18,
                      ),
                    ],
                  ),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(AssetImages.u1, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  _name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppFonts.tactic,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  _email,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppFonts.satoshi,
                    fontSize: 14.sp,
                    color: AppColors.white.withValues(alpha: 0.6),
                  ),
                ),
                SizedBox(height: 22.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF09062B),
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ProfileInfoRow(label: 'Full Name', value: _name),
                      const _ProfileDivider(),
                      // _ProfileInfoRow(
                      //   label: 'Address',
                      //   value: _address,
                      //   alignValueStart: true,
                      // ),
                      14.verticalSpace,
                      Text(
                        'Address',
                        style: TextStyle(
                          fontFamily: AppFonts.satoshi,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white.withValues(alpha: 0.85),
                        ),
                      ),
                      5.verticalSpace,
                      Text(
                        _address,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: AppFonts.satoshi,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white.withValues(alpha: 0.55),
                          height: 1.45,
                        ),
                      ),
                      14.verticalSpace,
                      const _ProfileDivider(),
                      _ProfileInfoRow(label: 'City', value: 'Albany'),
                      const _ProfileDivider(),
                      _ProfileInfoRow(label: 'State', value: 'New York'),
                      const _ProfileDivider(),
                      _ProfileInfoRow(label: 'Gender', value: 'Male'),
                      const _ProfileDivider(),
                      _ProfileInfoRow(
                        label: 'Email',
                        value: _email,
                        verified: true,
                      ),
                      const _ProfileDivider(),
                      _ProfileInfoRow(
                        label: 'Phone Number',
                        value: _phone,
                        verified: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 0.h),
          child: PrimaryButton(
            label: 'Edit Profile',
            onPressed: () => Get.to(() => const EditProfileScreen()),
            height: 52.h,
            borderRadius: 30.r,
          ),
        ),
      ],
    );
  }
}

class _ProfileInfoRow extends StatelessWidget {
  const _ProfileInfoRow({
    required this.label,
    required this.value,
    this.verified = false,
  });

  final String label;
  final String value;
  final bool verified;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 110.w,
            child: Text(
              label,
              style: TextStyle(
                fontFamily: AppFonts.satoshi,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.white.withValues(alpha: 0.85),
              ),
            ),
          ),
          Expanded(
            child: verified
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 18.w,
                        height: 18.w,
                        decoration: const BoxDecoration(
                          color: Color(0xff374856),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check,
                          color: AppColors.white,
                          size: 11.w,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Flexible(
                        child: Text(
                          value,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: AppFonts.satoshi,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white.withValues(alpha: 0.55),
                          ),
                        ),
                      ),
                    ],
                  )
                : Text(
                    value,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: AppFonts.satoshi,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white.withValues(alpha: 0.55),
                      height: 1.45,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class _ProfileDivider extends StatelessWidget {
  const _ProfileDivider();

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.white.withValues(alpha: 0.08),
    );
  }
}
