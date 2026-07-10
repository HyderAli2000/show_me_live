import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_images.dart';
import 'package:show_me_live/features/home/widgets/send_gift_bottom_sheet.dart';

class LiveStreamScreen extends StatefulWidget {
  const LiveStreamScreen({super.key, this.title, this.isCreated = false});

  final String? title;
  final bool? isCreated;

  @override
  State<LiveStreamScreen> createState() => _LiveStreamScreenState();
}

class _LiveStreamScreenState extends State<LiveStreamScreen> {
  static const _baseLikeCount = 1200;

  bool _isLiked = false;
  int _likeCount = _baseLikeCount;

  void _toggleLike() {
    setState(() {
      if (_isLiked) {
        _isLiked = false;
        _likeCount = _baseLikeCount;
      } else {
        _isLiked = true;
        _likeCount = _baseLikeCount + 1;
      }
    });
  }

  String get _formattedLikeCount {
    if (_likeCount >= 1000) {
      final value = _likeCount / 1000;
      return value == value.roundToDouble()
          ? '${value.toStringAsFixed(0)}k'
          : '${value.toStringAsFixed(1)}k';
    }
    return '$_likeCount';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AssetImages.eve1, fit: BoxFit.cover),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.45),
                  Colors.transparent,
                  AppColors.darkBlue.withValues(alpha: 0.2),
                ],
                stops: const [0, 0.45, 1],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(30.w, 8.h, 18.w, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 5.h,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE53935),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text(
                                'Live',
                                style: TextStyle(
                                  fontFamily: AppFonts.arial,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              widget.title ?? 'Lorem ipsum dolor sit amet.',
                              style: TextStyle(
                                fontFamily: AppFonts.arial,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                Icon(
                                  Icons.people_outline,
                                  color: AppColors.white,
                                  size: 18.w,
                                ),
                                SizedBox(width: 6.w),
                                Text(
                                  '1.9k',
                                  style: TextStyle(
                                    fontFamily: AppFonts.arial,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: Get.back,
                        child: Icon(
                          Icons.close,
                          color: AppColors.white,
                          size: 26.w,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                widget.isCreated != true
                    ? Padding(
                        padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 20.h),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    cursorColor: AppColors.white,
                                    style: TextStyle(
                                      fontFamily: AppFonts.arial,
                                      fontSize: 14.sp,
                                      color: AppColors.white,
                                    ),

                                    decoration: InputDecoration(
                                      fillColor: AppColors.white.withValues(
                                        alpha: 0.2,
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 15.h,
                                      ),
                                      filled: true,
                                      isCollapsed: true,
                                      border: InputBorder.none,
                                      hintText: 'Send a Message',
                                      hintStyle: TextStyle(
                                        fontFamily: AppFonts.arial,
                                        fontSize: 14.sp,
                                        color: AppColors.white.withValues(
                                          alpha: 0.55,
                                        ),
                                      ),

                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white.withValues(
                                            alpha: 0.15,
                                          ),
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          99999.r,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white.withValues(
                                            alpha: 0.15,
                                          ),
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          99999.r,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white.withValues(
                                            alpha: 0.15,
                                          ),
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          99999.r,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white.withValues(
                                            alpha: 0.15,
                                          ),
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          99999.r,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              children: [
                                _StatusPill(
                                  icon: _isLiked
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  label: _formattedLikeCount,
                                  iconColor: AppColors.white,
                                  onTap: _toggleLike,
                                ),
                                SizedBox(width: 10.w),
                                _StatusPill(
                                  icon: Icons.people_outline,
                                  label: '1.9k',
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () => showSendGiftBottomSheet(context),
                                  child: Container(
                                    width: 52.w,
                                    height: 52.w,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF6155F9),
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(
                                            0xFF7B3DFF,
                                          ).withValues(alpha: 0.45),
                                          blurRadius: 14,
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      Icons.card_giftcard_rounded,
                                      color: AppColors.white,
                                      size: 26.w,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 30.h,
                          ),
                          child: Container(
                            height: 55.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.googleRed,
                              borderRadius: BorderRadius.circular(999999.r),
                            ),
                            child: Center(
                              child: Text(
                                'End Live',
                                style: TextStyle(
                                  fontFamily: AppFonts.arial,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({
    required this.icon,
    required this.label,
    this.onTap,
    this.iconColor,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 7.h),
        decoration: BoxDecoration(
          color: AppColors.darkBlue,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: iconColor ?? AppColors.white),
            SizedBox(width: 6.w),
            Text(
              label,
              style: TextStyle(
                fontFamily: AppFonts.arial,
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
