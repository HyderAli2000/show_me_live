import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_images.dart';
import 'package:show_me_live/core/widgets/app_background.dart';
import 'package:show_me_live/features/auth/screens/login_screen.dart';
import 'package:show_me_live/features/onboarding/models/onboarding_item.dart';
import 'package:show_me_live/features/onboarding/widgets/onboarding_indicator.dart';
import 'package:show_me_live/features/onboarding/widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static const _items = <OnboardingItem>[
    OnboardingItem(
      image: AssetImages.onboarding1,
      title: 'Never Miss an Event Again',
      description:
          'Get reminders, save your favorites, and stay connected to every live experience.',
    ),
    OnboardingItem(
      image: AssetImages.onboarding2,
      title: 'Live Events. Real Connections.',
      description:
          'Step into immersive experiences where you watch, interact, and engage all in one place.',
    ),
    OnboardingItem(
      image: AssetImages.onboarding3,
      title: 'Watch. Engage. Enjoy.',
      description:
          'Join live events, chat in real time, and experience entertainment like never before.',
    ),
  ];

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onSkip() {
    Get.offAll(() => const LoginScreen());
  }

  void _onPageChanged(int index) {
    setState(() => _currentPage = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Onboarding',
          style: TextStyle(
            fontFamily: AppFonts.satoshi,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
        actions: [
          TextButton(
            onPressed: _onSkip,
            child: Text(
              'Skip',
              style: TextStyle(
                fontFamily: AppFonts.satoshi,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    return OnboardingPage(item: _items[index]);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 24.h),
                child: OnboardingIndicator(
                  count: _items.length,
                  activeIndex: _currentPage,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
