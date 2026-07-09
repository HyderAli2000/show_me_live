import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_icons.dart';
import 'package:show_me_live/core/theme/assets_images.dart';
import 'package:show_me_live/core/widgets/app_top_bar.dart';

class LoginDevicesScreen extends StatelessWidget {
  const LoginDevicesScreen({super.key});

  static const _devices = [
    _DeviceSession(
      sessionTitle: '1 Session on Android phone',
      lastActive: 'Last active: 12:05 PM',
      deviceName: 'Google Pixel 6 Pro',
      location: 'New York, NY, USA',
      deviceType: 'Android device',
      isNew: true,
    ),
    _DeviceSession(
      sessionTitle: '1 Session on Android phone',
      lastActive: 'Last active: 12:05 PM',
      deviceName: 'Samsung Galaxy S22',
      location: 'Dallas, TX, USA',
      deviceType: 'Android device',
      isNew: true,
    ),
  ];

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
        appBar: const AppTopBar(title: 'Login Devices'),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(18.w, 16.h, 18.w, 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Devices',
                  style: TextStyle(
                    fontFamily: AppFonts.satoshi,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "You're signed in on these devices or have been in the last 28 days. There might be multiple activity sessions from the same device.",
                  style: TextStyle(
                    fontFamily: AppFonts.satoshi,
                    fontSize: 13.sp,
                    height: 1.5,
                    color: AppColors.white.withValues(alpha: 0.55),
                  ),
                ),
                SizedBox(height: 20.h),
                ..._devices.map(
                  (device) => Padding(
                    padding: EdgeInsets.only(bottom: 14.h),
                    child: _DeviceCard(device: device),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DeviceSession {
  const _DeviceSession({
    required this.sessionTitle,
    required this.lastActive,
    required this.deviceName,
    required this.location,
    required this.deviceType,
    this.isNew = false,
  });

  final String sessionTitle;
  final String lastActive;
  final String deviceName;
  final String location;
  final String deviceType;
  final bool isNew;
}

class _DeviceCard extends StatelessWidget {
  const _DeviceCard({required this.device});

  final _DeviceSession device;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xFF6155F9),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AssetIcons.device,
            width: 40.w,
            height: 40.w,
            color: Colors.black,
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  device.sessionTitle,
                  style: TextStyle(
                    fontFamily: AppFonts.satoshi,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  device.lastActive,
                  style: TextStyle(
                    fontFamily: AppFonts.satoshi,
                    fontSize: 13.sp,
                    color: AppColors.white.withValues(alpha: 0.85),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  device.deviceName,
                  style: TextStyle(
                    fontFamily: AppFonts.satoshi,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  device.location,
                  style: TextStyle(
                    fontFamily: AppFonts.satoshi,
                    fontSize: 13.sp,
                    color: AppColors.white.withValues(alpha: 0.7),
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  device.deviceType,
                  style: TextStyle(
                    fontFamily: AppFonts.satoshi,
                    fontSize: 13.sp,
                    color: AppColors.white.withValues(alpha: 0.55),
                  ),
                ),
                if (device.isNew) ...[
                  SizedBox(height: 8.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 3.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE53935),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      'New',
                      style: TextStyle(
                        fontFamily: AppFonts.satoshi,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: AppColors.white, size: 16.w),
        ],
      ),
    );
  }
}
