import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';

class HomeTabPlaceholder extends StatelessWidget {
  const HomeTabPlaceholder({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(
          fontFamily: AppFonts.satoshi,
          fontSize: 20.sp,
          color: AppColors.white,
        ),
      ),
    );
  }
}
