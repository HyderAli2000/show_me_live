import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';

class AppBottomNavItem {
  const AppBottomNavItem({required this.label, this.iconAsset, this.iconData})
    : assert(
        iconAsset != null || iconData != null,
        'Provide either iconAsset or iconData',
      );

  final String label;
  final String? iconAsset;
  final IconData? iconData;
}

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
    this.onFabTap,
    this.showFab = true,
    this.horizontalPadding,
    this.bottomPadding,
  }) : assert(items.length == 5, 'Navbar expects exactly 5 items');

  final int currentIndex;
  final List<AppBottomNavItem> items;
  final ValueChanged<int> onTap;
  final VoidCallback? onFabTap;
  final bool showFab;
  final double? horizontalPadding;
  final double? bottomPadding;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          horizontalPadding ?? 20.w,
          0,
          horizontalPadding ?? 20.w,
          bottomPadding ?? 12.h,
        ),
        child: SizedBox(
          height: 108.h,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 82.h,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    stops: [0.0, 1.0],
                    colors: [Color(0xff1301FC), Color(0xff05042B)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(9999),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  children: List.generate(items.length, (index) {
                    return Expanded(
                      child: _NavItem(
                        item: items[index],
                        selected: currentIndex == index,
                        onTap: () => onTap(index),
                      ),
                    );
                  }),
                ),
              ),
              // if (showFab)
              //   Positioned(
              //     top: 0,
              //     right: 18.w,
              //     child: GestureDetector(
              //       onTap: onFabTap,
              //       child: Container(
              //         width: 58.w,
              //         height: 58.w,
              //         decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           gradient: const LinearGradient(
              //             begin: Alignment.topLeft,
              //             end: Alignment.bottomRight,
              //             colors: [
              //               AppColors.fabGradientStart,
              //               AppColors.fabGradientEnd,
              //             ],
              //           ),
              //           boxShadow: [
              //             BoxShadow(
              //               color: AppColors.fabGradientStart.withValues(
              //                 alpha: 0.45,
              //               ),
              //               blurRadius: 18,
              //               offset: const Offset(0, 6),
              //             ),
              //           ],
              //         ),
              //         child: Icon(
              //           Icons.add_rounded,
              //           color: AppColors.darkBlue,
              //           size: 30.sp,
              //         ),
              //       ),
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final AppBottomNavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final activeColor = AppColors.white;
    final inactiveColor = AppColors.white.withValues(alpha: 0.4);
    final labelColor = selected ? activeColor : inactiveColor;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(9999),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: SizedBox(
          height: double.infinity,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (item.iconAsset != null)
                  Image.asset(
                    item.iconAsset!,
                    width: 22.w,
                    height: 22.h,
                    fit: BoxFit.contain,
                    color: labelColor,
                  )
                else
                  Icon(item.iconData, size: 22.sp, color: labelColor),
                SizedBox(height: 4.h),
                Text(
                  item.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: AppFonts.satoshi,
                    fontSize: 14.sp,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                    color: labelColor,
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
