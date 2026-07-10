import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_icons.dart';
import 'package:show_me_live/core/widgets/app_background.dart';
import 'package:show_me_live/core/widgets/primary_button.dart';
import 'package:show_me_live/features/permissions/screens/allow_location_screen.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 70.w,
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
        title: Text(
          'Create Profile',
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
      body: AppBackground(
        blurBackground: false,
        child: SafeArea(
          bottom: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              children: [
                SizedBox(height: 18.h),
                Container(
                  width: 140.w,
                  height: 140.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white.withValues(alpha: 0.56),
                      width: 8.w,
                    ),
                  ),
                  child: Container(
                    width: 132.w,
                    height: 132.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                    ),
                    child: Center(
                      child: Image.asset(
                        AssetIcons.cam,
                        width: 36.w,
                        height: 36.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
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
                            color: AppColors.darkBlue,
                          ),
                        ),
                        SizedBox(height: 14.h),
                        const _ProfileField(
                          hintText: 'William.roy@domain.com',
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
                                  color: AppColors.darkBlue,
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
                      ],
                    ),
                  ),
                ),
                20.verticalSpace,
                PrimaryButton(
                  label: 'Continue',
                  onPressed: () => Get.to(() => const AllowLocationScreen()),
                  backgroundColor: AppColors.buttonBlue,
                  height: 52.h,
                  borderRadius: 30.r,
                ),
                20.verticalSpace,
              ],
            ),
          ),
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
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.55),
          width: 1,
        ),
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
                  color: AppColors.white,
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
            color: AppColors.darkBlue,
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
