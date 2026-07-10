import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_icons.dart';
import 'package:show_me_live/core/theme/assets_images.dart';
import 'package:show_me_live/features/home/screens/account_settings_screen.dart';

class AppHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppHomeAppBar({
    super.key,
    this.userName = 'William Roy',
    this.onNotificationTap,
    this.onAddTap,
    this.onSearchTap,
    this.showSearchRow = true,
  });

  final String userName;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onAddTap;
  final VoidCallback? onSearchTap;
  final bool showSearchRow;

  @override
  Size get preferredSize => Size.fromHeight(showSearchRow ? 148.h : 72.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      toolbarHeight: preferredSize.height,
      titleSpacing: 0,
      title: Padding(
        padding: EdgeInsets.fromLTRB(18.w, 8.h, 18.w, 0),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const AccountSettingsScreen());
                  },
                  child: Container(
                    width: 50.w,
                    height: 50.w,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AssetImages.u1),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.darkBlue.withValues(alpha: 0.35),
                          blurRadius: 10,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                  ),
                ),
                12.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontFamily: AppFonts.arial,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white.withValues(alpha: 0.7),
                        ),
                      ),
                      2.verticalSpace,
                      Text(
                        userName,
                        style: TextStyle(
                          fontFamily: AppFonts.arial,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: onNotificationTap,
                  child: Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryBlue.withValues(alpha: 0.8),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryBlue.withValues(alpha: 0.35),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 24.r,
                      backgroundColor: AppColors.inputFill,
                      child: Image.asset(
                        AssetIcons.noti,
                        width: 22.w,
                        height: 22.h,
                        fit: BoxFit.contain,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (showSearchRow) ...[
              16.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: onSearchTap,
                      child: Container(
                        height: 48.h,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: AppColors.inputFill.withValues(alpha: 0.85),
                          borderRadius: BorderRadius.circular(30.r),
                          border: Border.all(
                            color: AppColors.primaryBlue.withValues(
                              alpha: 0.45,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search_rounded,
                              color: AppColors.white.withValues(alpha: 0.55),
                              size: 22.sp,
                            ),
                            10.horizontalSpace,
                            Text(
                              'Search creator...',
                              style: TextStyle(
                                fontFamily: AppFonts.arial,
                                fontSize: 14.sp,
                                color: AppColors.white.withValues(alpha: 0.45),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  12.horizontalSpace,
                  GestureDetector(
                    onTap: onAddTap,
                    child: Container(
                      width: 48.w,
                      height: 48.w,
                      decoration: BoxDecoration(
                        color: AppColors.buttonBlue,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.buttonBlue.withValues(alpha: 0.45),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.add_rounded,
                        color: AppColors.white,
                        size: 26.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
