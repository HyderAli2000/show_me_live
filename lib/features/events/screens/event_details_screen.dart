import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_icons.dart';
import 'package:show_me_live/core/theme/assets_images.dart';
import 'package:show_me_live/core/widgets/primary_button.dart';
import 'package:show_me_live/features/events/models/event_checkout_data.dart';
import 'package:show_me_live/features/events/screens/checkout_screen.dart';
import 'package:show_me_live/features/events/widgets/event_screen_app_bar.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key, required this.event});

  final EventCheckoutData event;

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
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.w, 14.h, 18.w, 30.h),

                child: SafeArea(
                  top: false,
                  child: Row(
                    children: [
                      Text(
                        event.price,
                        style: TextStyle(
                          fontFamily: AppFonts.arial,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: PrimaryButton(
                          label: 'Buy Ticket',
                          onPressed: () =>
                              Get.to(() => CheckoutScreen(event: event)),
                          height: 52.h,
                          borderRadius: 30.r,
                        ),
                      ),
                    ],
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
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white.withValues(alpha: 0.55),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                value,
                style: TextStyle(
                  fontFamily: AppFonts.arial,
                  fontSize: 15.sp,
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
