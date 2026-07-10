import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/widgets/app_background.dart';

enum AgreementsTab { terms, privacy }

class AgreementsScreen extends StatefulWidget {
  const AgreementsScreen({super.key, this.initialTab = AgreementsTab.terms});

  final AgreementsTab initialTab;

  @override
  State<AgreementsScreen> createState() => _AgreementsScreenState();
}

class _AgreementsScreenState extends State<AgreementsScreen> {
  late AgreementsTab _activeTab;

  @override
  void initState() {
    super.initState();
    _activeTab = widget.initialTab;
  }

  @override
  Widget build(BuildContext context) {
    final bodyText = _activeTab == AgreementsTab.terms
        ? _loremTerms
        : _loremPrivacy;

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
          'Agreements',
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    Expanded(
                      child: _agreementTabItem(
                        label: 'Terms & Conditions',
                        isActive: _activeTab == AgreementsTab.terms,
                        onTap: () =>
                            setState(() => _activeTab = AgreementsTab.terms),
                      ),
                    ),
                    SizedBox(width: 18.w),
                    Expanded(
                      child: _agreementTabItem(
                        label: 'Privacy Policy',
                        isActive: _activeTab == AgreementsTab.privacy,
                        onTap: () =>
                            setState(() => _activeTab = AgreementsTab.privacy),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bodyText,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _agreementTabItem({
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppFonts.arial,
                fontSize: 16.sp,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                color: isActive
                    ? AppColors.white
                    : AppColors.white.withValues(alpha: 0.45),
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            height: 2.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: isActive
                  ? AppColors.primaryBlue
                  : AppColors.white.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(99),
            ),
          ),
        ],
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
''';

const String _loremPrivacy = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis
felis vitae nisi sit amet. Integer in nisi at nunc commodo interdum.
Aliquet nec, urna, sit amet scelerisque. Lorem ipsum dolor sit amet.
Consectetur adipiscing elit. Quisque at nibh at lectus iaculis.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis
unde omnis iste natus error sit voluptatem accusantium doloremque.
''';
