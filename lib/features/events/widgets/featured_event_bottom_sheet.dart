import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/widgets/primary_button.dart';

enum FeaturedPlan {
  daily(
    label: 'Daily Featured Plan',
    price: r'$10',
    period: '/Day',
    payAmount: r'$10',
  ),
  weekly(
    label: 'Weekly Featured Plan',
    price: r'$50',
    period: '/Week',
    payAmount: r'$50',
  );

  const FeaturedPlan({
    required this.label,
    required this.price,
    required this.period,
    required this.payAmount,
  });

  final String label;
  final String price;
  final String period;
  final String payAmount;
}

void showFeaturedEventBottomSheet({
  required BuildContext context,
  required VoidCallback onSkip,
  required ValueChanged<FeaturedPlan> onAddNow,
}) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => FeaturedEventBottomSheet(
      onSkip: onSkip,
      onAddNow: onAddNow,
    ),
  );
}

class FeaturedEventBottomSheet extends StatefulWidget {
  const FeaturedEventBottomSheet({
    super.key,
    required this.onSkip,
    required this.onAddNow,
  });

  final VoidCallback onSkip;
  final ValueChanged<FeaturedPlan> onAddNow;

  @override
  State<FeaturedEventBottomSheet> createState() => _FeaturedEventBottomSheetState();
}

class _FeaturedEventBottomSheetState extends State<FeaturedEventBottomSheet> {
  FeaturedPlan _selectedPlan = FeaturedPlan.daily;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF120A45),
            const Color(0xFF0A0640),
          ],
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(18.w, 10.h, 18.w, 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 100.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Featured Your Event',
                style: TextStyle(
                  fontFamily: AppFonts.arial,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                children: FeaturedPlan.values.map((plan) {
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: plan == FeaturedPlan.daily ? 8.w : 0,
                        left: plan == FeaturedPlan.weekly ? 8.w : 0,
                      ),
                      child: _FeaturedPlanCard(
                        plan: plan,
                        selected: _selectedPlan == plan,
                        onTap: () => setState(() => _selectedPlan = plan),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 22.h),
              GestureDetector(
                onTap: widget.onSkip,
                child: Text(
                  'Skip for Now',
                  style: TextStyle(
                    fontFamily: AppFonts.arial,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white.withValues(alpha: 0.85),
                  ),
                ),
              ),
              SizedBox(height: 18.h),
              PrimaryButton(
                label: 'Add now',
                onPressed: () => widget.onAddNow(_selectedPlan),
                height: 52.h,
                borderRadius: 30.r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeaturedPlanCard extends StatelessWidget {
  const _FeaturedPlanCard({
    required this.plan,
    required this.selected,
    required this.onTap,
  });

  final FeaturedPlan plan;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        height: 120.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              selected
                  ? const Color(0xFF3527FF)
                  : AppColors.primaryBlue.withValues(alpha: 0.18),
              selected
                  ? const Color(0xFF1507B8)
                  : AppColors.darkBlue.withValues(alpha: 0.25),
            ],
          ),
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: selected
                ? AppColors.white.withValues(alpha: 0.75)
                : Colors.white.withValues(alpha: 0.10),
            width: selected ? 2 : 1,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: AppColors.primaryBlue.withValues(alpha: 0.35),
                    blurRadius: 18.r,
                    offset: Offset(0, 8.h),
                  ),
                ]
              : null,
        ),
        child: Stack(
          children: [
            if (selected)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 18.w,
                  height: 18.w,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check_rounded,
                    color: AppColors.darkBlue,
                    size: 14.sp,
                  ),
                ),
              ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    plan.label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppFonts.arial,
                      fontSize: 11.sp,
                      fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                      color: AppColors.white.withValues(
                        alpha: selected ? 1 : 0.62,
                      ),
                      height: 1.25,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontFamily: AppFonts.arial,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white.withValues(
                          alpha: selected ? 1 : 0.72,
                        ),
                      ),
                      children: [
                        TextSpan(text: plan.price),
                        TextSpan(
                          text: plan.period,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
