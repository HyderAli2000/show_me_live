import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_icons.dart';
import 'package:show_me_live/core/theme/assets_images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _categories = <_CategoryData>[
    _CategoryData(label: 'All', image: AssetImages.cat1),
    _CategoryData(label: 'Music', image: AssetImages.cat2),
    _CategoryData(label: 'E-Sports', image: AssetImages.cat3),
    _CategoryData(label: 'Comedy', image: AssetImages.cat4),
  ];

  static const _featuredEvents = <_EventData>[
    _EventData(
      image: AssetImages.eve1,
      category: 'Gaming',
      title: 'Lorem ipsum dolor sit amet, consectetur.',
      price: '\$25.2',
      date: 'May 15, 2026',
    ),
    _EventData(
      image: AssetImages.eve2,
      category: 'Gaming',
      title: 'Lorem ipsum dolor sit amet, consectetur.',
      price: '\$25.2',
      date: 'May 15, 2026',
    ),
  ];

  static const _trendingEvents = <_EventData>[
    _EventData(
      image: AssetImages.eve1,
      category: 'Gaming',
      title: 'Lorem ipsum dolor sit amet, consectetur.',
      price: '\$25.2',
      date: 'May 15, 2026',
    ),
    _EventData(
      image: AssetImages.eve2,
      category: 'Gaming',
      title: 'Lorem ipsum dolor sit amet, consectetur.',
      price: '\$25.2',
      date: 'May 15, 2026',
    ),
    _EventData(
      image: AssetImages.eve1,
      category: 'Gaming',
      title: 'Lorem ipsum dolor sit amet, consectetur.',
      price: '\$25.2',
      date: 'May 15, 2026',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(18.w, 8.h, 18.w, 120.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionTitle(title: 'Categories'),
            SizedBox(height: 14.h),
            SizedBox(
              height: 110.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                separatorBuilder: (_, __) => SizedBox(width: 14.w),
                itemBuilder: (context, index) {
                  final category = _categories[index];
                  return _CategoryItem(
                    label: category.label,
                    image: category.image,
                  );
                },
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Expanded(child: _SectionTitle(title: 'Featured Events')),
                Text(
                  'See All',
                  style: TextStyle(
                    fontFamily: AppFonts.satoshi,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white.withValues(alpha: 0.55),
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),
            SizedBox(
              height: 248.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _featuredEvents.length,
                separatorBuilder: (_, __) => SizedBox(width: 14.w),
                itemBuilder: (context, index) {
                  return _EventCard(
                    event: _featuredEvents[index],
                    width: 250.w,
                  );
                },
              ),
            ),
            SizedBox(height: 24.h),
            _SectionTitle(title: 'Trending Events'),
            SizedBox(height: 14.h),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _trendingEvents.length,
              separatorBuilder: (_, __) => SizedBox(height: 14.h),
              itemBuilder: (context, index) {
                return _EventCard(
                  event: _trendingEvents[index],
                  width: double.infinity,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 50.w,
        height: 50.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            stops: const [0.0, 0.3, 1.0],
            colors: [
              AppColors.fabGradientStart,
              AppColors.fabGradientStart,
              AppColors.fabGradientEnd,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryBlue.withValues(alpha: 0.35),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Icon(Icons.add, size: 24.sp, color: AppColors.darkBlue),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: AppFonts.tactic,
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({required this.label, required this.image});

  final String label;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72.w,
      child: Column(
        children: [
          Container(
            width: 72.w,
            height: 72.w,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: AppFonts.satoshi,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.white.withValues(alpha: 0.75),
            ),
          ),
        ],
      ),
    );
  }
}

class _EventCard extends StatelessWidget {
  const _EventCard({required this.event, required this.width});

  final _EventData event;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Color(0xff09062B),
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14.r),
                child: Image.asset(
                  event.image,
                  width: double.infinity,
                  height: 140.h,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 10.w,
                bottom: 10.h,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 5.h,
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
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
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
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                event.price,
                style: TextStyle(
                  fontFamily: AppFonts.tactic,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryBlue,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Image.asset(
                AssetIcons.eveB,
                width: 20.w,
                height: 20.h,
                fit: BoxFit.cover,
                color: AppColors.darkBlue,
              ),
              SizedBox(width: 6.w),
              Text(
                event.date,
                style: TextStyle(
                  fontFamily: AppFonts.satoshi,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white.withValues(alpha: 0.55),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CategoryData {
  const _CategoryData({required this.label, required this.image});

  final String label;
  final String image;
}

class _EventData {
  const _EventData({
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
}
