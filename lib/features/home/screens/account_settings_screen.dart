import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_icons.dart';
import 'package:show_me_live/core/theme/assets_images.dart';
import 'package:show_me_live/core/widgets/app_top_bar.dart';
import 'package:show_me_live/core/widgets/primary_button.dart';
import 'package:show_me_live/features/auth/screens/about_app.dart';
import 'package:show_me_live/features/auth/screens/agreements_screen.dart';
import 'package:show_me_live/features/home/screens/change_password_screen.dart';
import 'package:show_me_live/features/home/screens/chat_support_screen.dart';
import 'package:show_me_live/features/home/screens/delete_account_screen.dart';
import 'package:show_me_live/features/home/screens/faq_screen.dart';
import 'package:show_me_live/features/home/screens/login_devices_screen.dart';
import 'package:show_me_live/features/home/widgets/logout_dialog.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  static const _name = 'William Roy';
  static const _email = 'william.roy@domain.com';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetImages.allBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: const AppTopBar(title: 'Account Settings'),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 8.h),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(18.w, 12.h, 18.w, 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ProfileCard(name: _name, email: _email),
                      SizedBox(height: 22.h),
                      const _SectionHeader(title: 'App Settings'),
                      SizedBox(height: 12.h),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 14.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF09062B),
                          borderRadius: BorderRadius.circular(18.r),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.08),
                          ),
                        ),
                        child: Column(
                          children: [
                            10.verticalSpace,
                            _SettingsTile(
                              icon: AssetIcons.tnc,
                              title: 'Terms and Conditions | Privacy Policy',
                              subtitle: 'Read our policies',
                              onTap: () {
                                Get.to(() => const AgreementsScreen());
                              },
                            ),
                            20.verticalSpace,
                            Divider(color: AppColors.darkBlue),
                            20.verticalSpace,
                            _SettingsTile(
                              icon: AssetIcons.about,
                              title: 'About App',
                              subtitle: 'Version 1.0.0',
                              onTap: () => Get.to(() => const AboutApp()),
                            ),
                            10.verticalSpace,
                          ],
                        ),
                      ),
                      SizedBox(height: 22.h),
                      const _SectionHeader(title: 'Account'),
                      SizedBox(height: 12.h),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 14.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF09062B),
                          borderRadius: BorderRadius.circular(18.r),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.08),
                          ),
                        ),
                        child: Column(
                          children: [
                            10.verticalSpace,
                            _SettingsTile(
                              icon: AssetIcons.locki,
                              title: 'Change Password',
                              subtitle: 'Update your password',
                              onTap: () =>
                                  Get.to(() => const ChangePasswordScreen()),
                            ),
                            40.verticalSpace,
                            _SettingsTile(
                              icon: AssetIcons.device,
                              title: 'Login Device',
                              subtitle: 'Login Sessions',
                              onTap: () =>
                                  Get.to(() => const LoginDevicesScreen()),
                            ),
                            40.verticalSpace,
                            _SettingsTile(
                              icon: AssetIcons.dlt,
                              title: 'Delete Account',
                              subtitle: 'Permanently delete your account',
                              onTap: () =>
                                  Get.to(() => const DeleteAccountScreen()),
                            ),
                            40.verticalSpace,
                            _SettingsTile(
                              icon: AssetIcons.supp,
                              title: 'Chat Support',
                              subtitle: 'Get help from our support team',
                              onTap: () =>
                                  Get.to(() => const ChatSupportScreen()),
                            ),
                            40.verticalSpace,

                            _SettingsTile(
                              icon: AssetIcons.about,
                              title: 'FAQ\'s',
                              subtitle: 'Frequently Asked Questions',
                              onTap: () => Get.to(() => const FaqScreen()),
                            ),
                            10.verticalSpace,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 30.h),
                child: PrimaryButton(
                  label: 'Logout',
                  onPressed: showLogoutDialog,
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

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({required this.name, required this.email});

  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Color(0xff6155F9),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Image.asset(AssetImages.u1, fit: BoxFit.cover),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontFamily: AppFonts.arial,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  email,
                  style: TextStyle(
                    fontFamily: AppFonts.arial,
                    fontSize: 13.sp,
                    color: AppColors.white.withValues(alpha: 0.75),
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: AppColors.white, size: 16.w),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: AppFonts.arial,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 45.w,
            height: 45.w,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: AppColors.darkBlue,
              shape: BoxShape.circle,
            ),
            child: Image.asset(icon, fit: BoxFit.fitHeight),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: AppFonts.arial,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                5.verticalSpace,
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: AppFonts.arial,
                    fontSize: 14.sp,
                    color: AppColors.white.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.white.withValues(alpha: 0.6),
            size: 15.w,
          ),
        ],
      ),
    );
  }
}
