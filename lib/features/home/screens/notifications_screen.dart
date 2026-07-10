import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_images.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  static const _notifications = [
    _NotificationItem(
      title: 'Your Event Starts Soon',
      description:
          'Reminder - Lorem ipsum dolor sit amet consectetur. Sit scelerisque nibh ullamcorper.',
      time: 'Today',
    ),
    _NotificationItem(
      title: 'Your Event Starts Soon',
      description:
          'Reminder - Lorem ipsum dolor sit amet consectetur. Sit scelerisque nibh ullamcorper.',
      time: 'Today',
    ),
    _NotificationItem(
      title: 'Your Event Starts Soon',
      description:
          'Reminder - Lorem ipsum dolor sit amet consectetur. Sit scelerisque nibh ullamcorper.',
      time: 'Today',
    ),
    _NotificationItem(
      title: 'Your Event Starts Soon',
      description:
          'Reminder - Lorem ipsum dolor sit amet consectetur. Sit scelerisque nibh ullamcorper.',
      time: 'Today',
    ),
    _NotificationItem(
      title: 'Your Event Starts Soon',
      description:
          'Reminder - Lorem ipsum dolor sit amet consectetur. Sit scelerisque nibh ullamcorper.',
      time: 'Today',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 70.w,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Text(
          'Notifications',
          style: TextStyle(
            fontFamily: AppFonts.arial,
            fontSize: 21.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            margin: EdgeInsets.only(left: 20.w),
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
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
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetImages.allBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: ListView.separated(
            padding: EdgeInsets.fromLTRB(18.w, 16.h, 18.w, 24.h),
            itemCount: _notifications.length,
            separatorBuilder: (_, __) => SizedBox(height: 12.h),
            itemBuilder: (context, index) {
              return _NotificationCard(item: _notifications[index]);
            },
          ),
        ),
      ),
    );
  }
}

class _NotificationItem {
  const _NotificationItem({
    required this.title,
    required this.description,
    required this.time,
  });

  final String title;
  final String description;
  final String time;
}

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({required this.item});

  final _NotificationItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: const Color(0xFF09062B),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  item.title,
                  style: TextStyle(
                    fontFamily: AppFonts.arial,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Text(
                item.time,
                style: TextStyle(
                  fontFamily: AppFonts.arial,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.buttonBlue,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            item.description,
            style: TextStyle(
              fontFamily: AppFonts.arial,
              fontSize: 13.sp,
              height: 1.45,
              color: AppColors.white.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}
