import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_icons.dart';
import 'package:show_me_live/core/widgets/app_success_screen.dart';
import 'package:show_me_live/core/widgets/primary_button.dart';
import 'package:show_me_live/features/home/models/gift_item.dart';

class GiftPurchaseFlow {
  GiftPurchaseFlow._();

  static void showPaymentDialog({required GiftItem gift}) {
    Get.dialog(
      _GiftPaymentDialog(gift: gift),
      barrierDismissible: true,
    );
  }

  static void showSuccessScreen({required GiftItem gift}) {
    Get.to(
      () => AppSuccessScreen(
        title: '${gift.name} Added',
        description:
            'Your purchase was successful. You can now use your stickers during live events.',
        primaryActionLabel: 'Continue',
        onPrimaryAction: Get.back,
      ),
    );
  }
}

class _GiftPaymentDialog extends StatefulWidget {
  const _GiftPaymentDialog({required this.gift});

  final GiftItem gift;

  @override
  State<_GiftPaymentDialog> createState() => _GiftPaymentDialogState();
}

class _GiftPaymentDialogState extends State<_GiftPaymentDialog> {
  int _selectedMethod = 0;

  @override
  Widget build(BuildContext context) {
    final amount = widget.gift.price;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(20.w, 18.h, 20.w, 22.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF0E0A3A),
              AppColors.backgroundDark.withValues(alpha: 0.98),
            ],
          ),
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color: AppColors.primaryBlue.withValues(alpha: 0.25),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment Method',
                          style: TextStyle(
                            fontFamily: AppFonts.tactic,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Complete your gift purchase',
                          style: TextStyle(
                            fontFamily: AppFonts.satoshi,
                            fontSize: 13.sp,
                            height: 1.4,
                            color: AppColors.white.withValues(alpha: 0.55),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: Get.back,
                    child: Icon(
                      Icons.close_rounded,
                      color: AppColors.white.withValues(alpha: 0.75),
                      size: 22.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(
                    color: AppColors.primaryBlue.withValues(alpha: 0.35),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      'Total Amount:',
                      style: TextStyle(
                        fontFamily: AppFonts.satoshi,
                        fontSize: 14.sp,
                        color: AppColors.white.withValues(alpha: 0.75),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      amount,
                      style: TextStyle(
                        fontFamily: AppFonts.tactic,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.h),
              Text(
                'Saved Payment Methods',
                style: TextStyle(
                  fontFamily: AppFonts.satoshi,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.4,
                  color: AppColors.white.withValues(alpha: 0.45),
                ),
              ),
              SizedBox(height: 10.h),
              _SavedPaymentTile(
                title: 'Visa **** 4242',
                subtitle: 'Expires 12/25',
                brandLabel: 'VISA',
                brandColor: const Color(0xFF1A1F71),
                selected: _selectedMethod == 0,
                onTap: () => setState(() => _selectedMethod = 0),
              ),
              SizedBox(height: 10.h),
              _SavedPaymentTile(
                title: 'Mastercard **** 8888',
                subtitle: 'Expires 09/26',
                brandLabel: 'MC',
                brandColor: const Color(0xFFEB001B),
                selected: _selectedMethod == 1,
                onTap: () => setState(() => _selectedMethod = 1),
              ),
              SizedBox(height: 18.h),
              Text(
                'Quick Pay',
                style: TextStyle(
                  fontFamily: AppFonts.satoshi,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.4,
                  color: AppColors.white.withValues(alpha: 0.45),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    child: _QuickPayButton(
                      label: 'Apple Pay',
                      icon: AssetIcons.apple,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _QuickPayButton(
                      label: 'Google Pay',
                      icon: AssetIcons.google,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              PrimaryButton(
                label: 'Pay $amount',
                onPressed: () {
                  Get.back();
                  GiftPurchaseFlow.showSuccessScreen(gift: widget.gift);
                },
                height: 50.h,
                borderRadius: 30.r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SavedPaymentTile extends StatelessWidget {
  const _SavedPaymentTile({
    required this.title,
    required this.subtitle,
    required this.brandLabel,
    required this.brandColor,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String brandLabel;
  final Color brandColor;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.inputFill.withValues(alpha: 0.65),
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: selected
                ? AppColors.primaryBlue.withValues(alpha: 0.55)
                : Colors.white.withValues(alpha: 0.08),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 38.w,
              height: 26.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: brandColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Text(
                brandLabel,
                style: TextStyle(
                  fontFamily: AppFonts.satoshi,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w800,
                  color: brandColor,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: AppFonts.satoshi,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontFamily: AppFonts.satoshi,
                      fontSize: 12.sp,
                      color: AppColors.white.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            ),
            if (selected)
              Icon(
                Icons.check_circle_rounded,
                color: AppColors.primaryBlue,
                size: 22.sp,
              ),
          ],
        ),
      ),
    );
  }
}

class _QuickPayButton extends StatelessWidget {
  const _QuickPayButton({required this.label, required this.icon});

  final String label;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.inputFill.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon, width: 18.w, height: 18.h),
          SizedBox(width: 8.w),
          Text(
            label,
            style: TextStyle(
              fontFamily: AppFonts.satoshi,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
