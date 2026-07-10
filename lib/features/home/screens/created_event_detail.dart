import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_icons.dart';
import 'package:show_me_live/core/theme/assets_images.dart';
import 'package:show_me_live/core/widgets/primary_button.dart';
import 'package:show_me_live/features/events/models/event_checkout_data.dart';
import 'package:show_me_live/features/events/widgets/event_screen_app_bar.dart';
import 'package:show_me_live/features/home/widgets/add_camera_flow.dart';

class CreatedEventDetailScreen extends StatelessWidget {
  const CreatedEventDetailScreen({
    super.key,
    required this.event,
    this.isLive = false,
    this.past = false,
    this.upcoming = false,
  });

  final EventCheckoutData event;
  final bool? isLive;
  final bool? past;
  final bool? upcoming;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: const EventScreenAppBar(title: 'Event Details'),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetImages.allBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(18.w, 8.h, 18.w, 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18.r),
                        child: Image.asset(
                          event.image,
                          width: double.infinity,
                          height: 210.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 18.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              event.title,
                              style: TextStyle(
                                fontFamily: AppFonts.arial,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                height: 1.35,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            event.price,
                            style: TextStyle(
                              fontFamily: AppFonts.arial,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryBlue,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14.h),
                      Text(
                        event.description,
                        style: TextStyle(
                          fontFamily: AppFonts.arial,
                          fontSize: 14.sp,
                          height: 1.55,
                          color: AppColors.white.withValues(alpha: 0.65),
                        ),
                      ),
                      SizedBox(height: 22.h),
                      _InfoRow(
                        icon: AssetIcons.eveB,
                        label: 'Date',
                        value: event.fullDate,
                      ),
                      SizedBox(height: 16.h),
                      _InfoRow(
                        icon: AssetIcons.clock,
                        label: 'Time',
                        value: event.time,
                      ),
                      SizedBox(height: 16.h),
                      _InfoRow(
                        icon: AssetIcons.atten,
                        label: 'Attendees',
                        value: event.attendees,
                      ),
                      SizedBox(height: 22.h),
                      Text(
                        'Event URL',
                        style: TextStyle(
                          fontFamily: AppFonts.arial,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        'Liveevent/Showmelivecreatores',
                        style: TextStyle(
                          fontFamily: AppFonts.arial,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white.withValues(alpha: 0.55),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (upcoming == true || past == true)
                Padding(
                  padding: EdgeInsets.fromLTRB(18.w, 14.h, 18.w, 30.h),
                  child: SafeArea(
                    top: false,
                    child: PrimaryButton(
                      label: upcoming == true || past == true
                          ? 'Add Another Camera'
                          : '',
                      onPressed: () {
                        if (upcoming == true || past == true) {
                          AddCameraFlow.start(
                            event: event,
                            onViewEvent: () => Get.back(),
                          );
                        }
                      },
                      height: 52.h,
                      borderRadius: 30.r,
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

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final String icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 25.w,
          height: 25.w,
          child: Image.asset(icon, color: AppColors.darkBlue),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontFamily: AppFonts.arial,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                value,
                style: TextStyle(
                  fontFamily: AppFonts.arial,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
