import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_icons.dart';
import 'package:show_me_live/core/theme/assets_images.dart';
import 'package:show_me_live/core/widgets/primary_button.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  void _showProfileUpdatedDialog() {
    Get.dialog(const _ProfileUpdatedDialog(), barrierDismissible: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 70.w,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            margin: EdgeInsets.only(left: 20.w),
            padding: EdgeInsets.all(10.w),
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 18.w,
              color: AppColors.darkBlue,
            ),
          ),
        ),
        title: Text(
          'Edit Profile',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: AppFonts.arial,
            fontSize: 21.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetImages.allBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          bottom: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              children: [
                SizedBox(height: 18.h),
                Container(
                  width: 150.w,
                  height: 150.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xff1301FC).withValues(alpha: 0.2),
                      width: 10.w,
                    ),
                    // gradient: const LinearGradient(
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight,
                    //   colors: [AppColors.primaryBlue, AppColors.fabGradientEnd],
                    // ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset(
                          AssetImages.u1,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: 36.w,
                        height: 36.w,
                        decoration: const BoxDecoration(
                          color: AppColors.darkBlue,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          AssetIcons.cam,
                          width: 20.w,
                          height: 20.w,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 28.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              child: _ProfileField(hintText: 'First Name'),
                            ),
                            SizedBox(width: 14.w),
                            const Expanded(
                              child: _ProfileField(hintText: 'Last Name'),
                            ),
                          ],
                        ),
                        SizedBox(height: 14.h),
                        const _ProfileField(hintText: 'Address'),
                        SizedBox(height: 14.h),
                        Row(
                          children: [
                            const Expanded(
                              child: _ProfileField(hintText: 'City'),
                            ),
                            SizedBox(width: 14.w),
                            const Expanded(
                              child: _ProfileField(hintText: 'State'),
                            ),
                          ],
                        ),
                        SizedBox(height: 14.h),
                        const _ProfileField(
                          hintText: 'Gender',
                          trailing: Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xff48576E),
                          ),
                        ),
                        SizedBox(height: 14.h),
                        const _ProfileField(
                          hintText: 'william.roy@domain.com',
                          trailing: _VerifiedBadge(),
                        ),
                        SizedBox(height: 14.h),
                        Row(
                          children: [
                            SizedBox(
                              width: 100.w,
                              child: const _ProfileField(
                                hintText: '+1',
                                trailing: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Color(0xff48576E),
                                ),
                              ),
                            ),
                            SizedBox(width: 14.w),
                            const Expanded(
                              child: _ProfileField(
                                hintText: '+123 456 7890',
                                trailing: _VerifiedBadge(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
                PrimaryButton(
                  label: 'Next',
                  onPressed: _showProfileUpdatedDialog,
                  height: 52.h,
                  borderRadius: 30.r,
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileUpdatedDialog extends StatelessWidget {
  const _ProfileUpdatedDialog();

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
              'Profile Updated',
              style: TextStyle(
                fontFamily: AppFonts.arial,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 24.h),
            Container(
              width: 88.w,
              height: 88.w,
              padding: EdgeInsets.all(25.w),
              decoration: const BoxDecoration(
                color: AppColors.buttonBlue,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                AssetIcons.thumb,
                width: 42.w,
                height: 42.w,
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 22.h),
            Text(
              'You have successfully update your profile.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppFonts.arial,
                fontSize: 14.sp,
                height: 1.5,
                color: AppColors.white.withValues(alpha: 0.65),
              ),
            ),
            SizedBox(height: 24.h),
            PrimaryButton(
              label: 'Continue',
              onPressed: () {
                Get.back();
                Get.back();
              },
              height: 50.h,
              borderRadius: 30.r,
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileField extends StatelessWidget {
  const _ProfileField({required this.hintText, this.trailing});

  final String hintText;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      decoration: BoxDecoration(
        color: AppColors.darkBlue.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.55)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: AppColors.darkBlue,
              style: TextStyle(
                fontFamily: AppFonts.arial,
                fontSize: 14.sp,
                color: AppColors.white,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  fontFamily: AppFonts.arial,
                  fontSize: 14.sp,
                  color: AppColors.white.withValues(alpha: 0.75),
                ),
                border: InputBorder.none,
                isCollapsed: true,
              ),
            ),
          ),
          if (trailing != null) ...[SizedBox(width: 8.w), trailing!],
        ],
      ),
    );
  }
}

class _VerifiedBadge extends StatelessWidget {
  const _VerifiedBadge();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 18.w,
          height: 18.w,
          decoration: const BoxDecoration(
            color: Color(0xff6155F9),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check, color: AppColors.white, size: 11.w),
        ),
        SizedBox(width: 6.w),
        Text(
          'Verified',
          style: TextStyle(
            fontFamily: AppFonts.arial,
            fontSize: 13.sp,
            color: AppColors.white.withValues(alpha: 0.55),
          ),
        ),
      ],
    );
  }
}
