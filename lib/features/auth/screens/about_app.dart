import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/widgets/app_background.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({super.key});

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 70.w,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            margin: EdgeInsets.only(left: 20.w),
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 18.w,
              color: AppColors.darkBlue,
            ),
          ),
        ),
        title: Text(
          'About App',
          style: TextStyle(
            fontFamily: AppFonts.arial,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: AppBackground(
        blurBackground: false,
        child: SafeArea(
          bottom: true,
          child: Column(
            children: [
              SizedBox(height: 8.h),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lorem ipsum dolor sit amet consectetur.',
                        style: TextStyle(
                          fontFamily: AppFonts.arial,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                      20.verticalSpace,
                      Text(
                        _loremTerms,
                        style: TextStyle(
                          fontFamily: AppFonts.arial,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white.withValues(alpha: 0.46),
                          height: 1.55,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              20.verticalSpace,
              Text(
                "Show Me Live",
                style: TextStyle(
                  fontFamily: AppFonts.arial,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff6155F9),
                ),
              ),
              10.verticalSpace,
              Text(
                'Version 1.0.0',
                style: TextStyle(
                  fontFamily: AppFonts.arial,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white.withValues(alpha: 0.46),
                ),
              ),
              30.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

const String _loremTerms = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis
felis vitae nisi sit amet. Integer in nisi at nunc commodo interdum.
Aliquet nec, urna, sit amet scelerisque. Lorem ipsum dolor sit amet.
Consectetur adipiscing elit. Quisque at nibh at lectus iaculis.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis
unde omnis iste natus error sit voluptatem accusantium doloremque.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis
felis vitae nisi sit amet. Integer in nisi at nunc commodo interdum.
Aliquet nec, urna, sit amet scelerisque. Lorem ipsum dolor sit amet.
Consectetur adipiscing elit. Quisque at nibh at lectus iaculis.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis
unde omnis iste natus error sit voluptatem accusantium doloremque.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis
felis vitae nisi sit amet. Integer in nisi at nunc commodo interdum.
Aliquet nec, urna, sit amet scelerisque. Lorem ipsum dolor sit amet.
Consectetur adipiscing elit. Quisque at nibh at lectus iaculis.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis
unde omnis iste natus error sit voluptatem accusantium doloremque.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis
felis vitae nisi sit amet. Integer in nisi at nunc commodo interdum.
Aliquet nec, urna, sit amet scelerisque. Lorem ipsum dolor sit amet.
Consectetur adipiscing elit. Quisque at nibh at lectus iaculis.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis
unde omnis iste natus error sit voluptatem accusantium doloremque.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis
felis vitae nisi sit amet. Integer in nisi at nunc commodo interdum.
Aliquet nec, urna, sit amet scelerisque. Lorem ipsum dolor sit amet.
Consectetur adipiscing elit. Quisque at nibh at lectus iaculis.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis
unde omnis iste natus error sit voluptatem accusantium doloremque.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis
felis vitae nisi sit amet. Integer in nisi at nunc commodo interdum.
Aliquet nec, urna, sit amet scelerisque. Lorem ipsum dolor sit amet.
Consectetur adipiscing elit. Quisque at nibh at lectus iaculis.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis
unde omnis iste natus error sit voluptatem accusantium doloremque.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis
felis vitae nisi sit amet. Integer in nisi at nunc commodo interdum.
Aliquet nec, urna, sit amet scelerisque. Lorem ipsum dolor sit amet.
Consectetur adipiscing elit. Quisque at nibh at lectus iaculis.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis
unde omnis iste natus error sit voluptatem accusantium doloremque.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis
felis vitae nisi sit amet. Integer in nisi at nunc commodo interdum.
Aliquet nec, urna, sit amet scelerisque. Lorem ipsum dolor sit amet.
Consectetur adipiscing elit. Quisque at nibh at lectus iaculis.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis
unde omnis iste natus error sit voluptatem accusantium doloremque.
''';
