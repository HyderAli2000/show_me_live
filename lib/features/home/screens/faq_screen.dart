import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_images.dart';
import 'package:show_me_live/core/widgets/app_top_bar.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  static const _question = 'Lorem ipsum dolor sit amet consectetur ?';
  static const _answer =
      'Lorem ipsum dolor sit amet consectetur. Sit scelerisque nibh '
      'ullamcorper justo nisl tortor habitant egestas cras. Vitae mauris '
      'duis faucibus aliquam nascetur. Quam ut id mi ut. Tempus in amet sed '
      'volutpat tristique vestibulum elementum. Ipsum viverra vitae egestas '
      'facilisis. Tempus sed egestas ullamcorper dictum integer magna sit '
      'quam pellentesque.';

  int _expandedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetImages.allBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppTopBar(title: "FAQ's"),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(18.w, 16.h, 18.w, 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Frequently Asked\nQuestions:',
                  style: TextStyle(
                    fontFamily: AppFonts.tactic,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                    height: 1.25,
                  ),
                ),
                SizedBox(height: 20.h),
                ...List.generate(8, (index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: _FaqItem(
                      question: _question,
                      answer: _answer,
                      isExpanded: _expandedIndex == index,
                      onTap: () {
                        setState(() {
                          _expandedIndex = _expandedIndex == index ? -1 : index;
                        });
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FaqItem extends StatelessWidget {
  const _FaqItem({
    required this.question,
    required this.answer,
    required this.isExpanded,
    required this.onTap,
  });

  final String question;
  final String answer;
  final bool isExpanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: isExpanded ? AppColors.buttonBlue : const Color(0xFF09062B),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      question,
                      style: TextStyle(
                        fontFamily: AppFonts.satoshi,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white.withValues(
                          alpha: isExpanded ? 1 : 0.85,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: AppColors.white,
                    size: 22.w,
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded)
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
              child: Text(
                answer,
                style: TextStyle(
                  fontFamily: AppFonts.satoshi,
                  fontSize: 13.sp,
                  height: 1.5,
                  color: AppColors.white.withValues(alpha: 0.85),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
