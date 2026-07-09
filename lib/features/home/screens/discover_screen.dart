import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_icons.dart';
import 'package:show_me_live/core/theme/assets_images.dart';
import 'package:show_me_live/features/events/models/event_checkout_data.dart';
import 'package:show_me_live/features/events/screens/event_details_screen.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  static const _events = <_DiscoverEvent>[
    _DiscoverEvent(
      image: AssetImages.eve1,
      category: 'Gaming',
      title: 'Lorem ipsum dolor sit amet,',
      price: r'$25.2',
      date: 'May 15, 2026',
    ),
    _DiscoverEvent(
      image: AssetImages.eve2,
      category: 'Gaming',
      title: 'Lorem ipsum dolor sit amet,',
      price: r'$25.2',
      date: 'May 15, 2026',
    ),
    _DiscoverEvent(
      image: AssetImages.u2,
      category: 'Gaming',
      title: 'Lorem ipsum dolor sit amet,',
      price: r'$25.2',
      date: 'May 15, 2026',
    ),
    _DiscoverEvent(
      image: AssetImages.u3,
      category: 'Gaming',
      title: 'Lorem ipsum dolor sit amet,',
      price: r'$25.2',
      date: 'May 15, 2026',
    ),
    _DiscoverEvent(
      image: AssetImages.u4,
      category: 'Gaming',
      title: 'Lorem ipsum dolor sit amet,',
      price: r'$25.2',
      date: 'May 15, 2026',
    ),
    _DiscoverEvent(
      image: AssetImages.u5,
      category: 'Gaming',
      title: 'Lorem ipsum dolor sit amet,',
      price: r'$25.2',
      date: 'May 15, 2026',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.fromLTRB(18.w, 4.h, 18.w, 120.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14.w,
        mainAxisSpacing: 14.h,
        childAspectRatio: 0.9,
      ),
      itemCount: _events.length,
      itemBuilder: (context, index) {
        return _DiscoverEventCard(event: _events[index]);
      },
    );
  }
}

class _DiscoverEventCard extends StatelessWidget {
  const _DiscoverEventCard({required this.event});

  final _DiscoverEvent event;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Get.to(() => EventDetailsScreen(event: event.toCheckoutData())),
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: const Color(0xFF09062B),
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14.r),
                    child: Image.asset(
                      event.image,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 8.w,
                    bottom: 8.h,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundDark.withValues(alpha: 0.85),
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: AppColors.primaryBlue.withValues(alpha: 0.35),
                        ),
                      ),
                      child: Text(
                        event.category,
                        style: TextStyle(
                          fontFamily: AppFonts.satoshi,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    event.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: AppFonts.satoshi,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.3,
                      color: AppColors.white,
                    ),
                  ),
                ),
                SizedBox(width: 6.w),
                Text(
                  event.price,
                  style: TextStyle(
                    fontFamily: AppFonts.tactic,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Row(
              children: [
                Image.asset(
                  AssetIcons.eveB,
                  width: 16.w,
                  height: 16.h,
                  fit: BoxFit.cover,
                  color: AppColors.darkBlue,
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Text(
                    event.date,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: AppFonts.satoshi,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white.withValues(alpha: 0.55),
                    ),
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

class _DiscoverEvent {
  const _DiscoverEvent({
    required this.image,
    required this.category,
    required this.title,
    required this.price,
    required this.date,
  });

  final String image;
  final String category;
  final String title;
  final String price;
  final String date;

  EventCheckoutData toCheckoutData() => EventCheckoutData(
    image: image,
    title: title,
    subtitle: 'Lorem ipsum dolor sit amet.',
    price: price,
    displayDate: date,
  );
}
