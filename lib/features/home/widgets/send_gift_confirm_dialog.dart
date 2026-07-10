import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/widgets/primary_button.dart';
import 'package:show_me_live/features/home/models/gift_item.dart';
import 'package:show_me_live/features/home/widgets/gift_purchase_flow.dart';

void showSendGiftConfirmDialog(GiftItem gift) {
  Get.dialog(
    _SendGiftConfirmDialog(gift: gift),
    barrierDismissible: true,
    barrierColor: Colors.black.withValues(alpha: 0.55),
  );
}

class _SendGiftConfirmDialog extends StatelessWidget {
  const _SendGiftConfirmDialog({required this.gift});

  final GiftItem gift;

  String get _cost => gift.price.replaceAll('\$', '');

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(22.w, 20.h, 22.w, 24.h),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: Get.back,
                child: Icon(
                  Icons.close_rounded,
                  color: AppColors.white.withValues(alpha: 0.75),
                  size: 22.sp,
                ),
              ),
            ),
            Container(
              width: 72.w,
              height: 72.w,
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: gift.stackColors[2],
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Image.asset(gift.image, fit: BoxFit.contain),
            ),
            SizedBox(height: 18.h),
            Text(
              'Send ${gift.name}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppFonts.arial,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Show your support to the performer',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppFonts.arial,
                fontSize: 13.sp,
                color: AppColors.white.withValues(alpha: 0.65),
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              '${gift.name} sent 🎉 (09) remaining',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppFonts.arial,
                fontSize: 13.sp,
                color: AppColors.white.withValues(alpha: 0.65),
              ),
            ),
            SizedBox(height: 22.h),
            _DetailRow(label: 'Gift', value: gift.name),
            SizedBox(height: 12.h),
            _DetailRow(label: 'Cost', value: _cost),
            SizedBox(height: 12.h),
            const _DetailRow(label: 'Your Balance After', value: '1,230'),
            SizedBox(height: 24.h),
            PrimaryButton(
              label: 'Send Gift',
              onPressed: () {
                Get.back();
                GiftPurchaseFlow.showPaymentDialog(gift: gift);
              },
              height: 50.h,
              borderRadius: 30.r,
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: AppFonts.arial,
            fontSize: 14.sp,
            color: AppColors.white.withValues(alpha: 0.55),
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontFamily: AppFonts.arial,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
