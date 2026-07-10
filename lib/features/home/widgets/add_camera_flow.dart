import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_icons.dart';
import 'package:show_me_live/core/widgets/app_success_screen.dart';
import 'package:show_me_live/core/widgets/app_text_field.dart';
import 'package:show_me_live/core/widgets/primary_button.dart';
import 'package:show_me_live/features/events/models/event_checkout_data.dart';
import 'package:show_me_live/navbar.dart';

class AddCameraFlow {
  AddCameraFlow._();

  static void start({
    required EventCheckoutData event,
    VoidCallback? onViewEvent,
  }) {
    Get.dialog(
      _AddAnotherCameraDialog(event: event, onViewEvent: onViewEvent),
      barrierDismissible: true,
    );
  }

  static void showPaymentDialog({
    required EventCheckoutData event,
    VoidCallback? onViewEvent,
  }) {
    Get.dialog(
      _ProCameraPaymentDialog(event: event, onViewEvent: onViewEvent),
      barrierDismissible: true,
    );
  }

  static void showEmailDialog({
    required EventCheckoutData event,
    VoidCallback? onViewEvent,
  }) {
    Get.dialog(
      _AddEmailAddressDialog(event: event, onViewEvent: onViewEvent),
      barrierDismissible: true,
    );
  }

  static void showSuccessScreen({
    required EventCheckoutData event,
    VoidCallback? onViewEvent,
  }) {
    Get.off(
      () => AppSuccessScreen(
        title: 'Cam 2 Added',
        description:
            'Camera 2 is now added. Preview and adjust before going live.',
        linkText: 'liveevent/showmelivecreatores',
        secondaryActionLabel: 'Back to Home',
        onSecondaryAction: () => Get.offAll(() => const Navbar()),
        primaryActionLabel: 'View Event',
        onPrimaryAction: onViewEvent ?? () => Get.offAll(() => const Navbar()),
      ),
    );
  }
}

class _DialogShell extends StatelessWidget {
  const _DialogShell({required this.child, this.padding});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Container(
        width: double.infinity,
        padding: padding ?? EdgeInsets.fromLTRB(20.w, 18.h, 20.w, 22.h),
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
        child: child,
      ),
    );
  }
}

class _DialogHeader extends StatelessWidget {
  const _DialogHeader({required this.title, this.subtitle});

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: AppFonts.arial,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
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
        if (subtitle != null) ...[
          SizedBox(height: 8.h),
          Text(
            subtitle!,
            style: TextStyle(
              fontFamily: AppFonts.arial,
              fontSize: 13.sp,
              height: 1.4,
              color: AppColors.white.withValues(alpha: 0.55),
            ),
          ),
        ],
      ],
    );
  }
}

class _AddAnotherCameraDialog extends StatelessWidget {
  const _AddAnotherCameraDialog({required this.event, this.onViewEvent});

  final EventCheckoutData event;
  final VoidCallback? onViewEvent;

  @override
  Widget build(BuildContext context) {
    return _DialogShell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _DialogHeader(
            title: 'Add Another Camera',
            subtitle: 'Additional \$1000 fee applies for Pro camera setup',
          ),
          SizedBox(height: 22.h),
          const _QrCodePlaceholder(),
          SizedBox(height: 22.h),
          GestureDetector(
            onTap: () {
              Get.back();
              AddCameraFlow.showEmailDialog(
                event: event,
                onViewEvent: onViewEvent,
              );
            },
            child: Text(
              'Add Email Address',
              style: TextStyle(
                fontFamily: AppFonts.arial,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.white.withValues(alpha: 0.85),
              ),
            ),
          ),
          SizedBox(height: 14.h),
          Text(
            'OR',
            style: TextStyle(
              fontFamily: AppFonts.arial,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.white.withValues(alpha: 0.45),
            ),
          ),
          SizedBox(height: 14.h),
          PrimaryButton(
            label: 'Share QR',
            onPressed: () {
              Get.back();
              AddCameraFlow.showPaymentDialog(
                event: event,
                onViewEvent: onViewEvent,
              );
            },
            height: 50.h,
            borderRadius: 30.r,
          ),
        ],
      ),
    );
  }
}

class _QrCodePlaceholder extends StatelessWidget {
  const _QrCodePlaceholder();

  static const _qrData = 'liveevent/showmelivecreatores';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180.w,
      height: 180.w,
      child: QrImageView(
        data: _qrData,
        size: 152.w,
        backgroundColor: Colors.transparent,
        eyeStyle: const QrEyeStyle(
          eyeShape: QrEyeShape.square,
          color: AppColors.buttonBlue,
        ),
        dataModuleStyle: const QrDataModuleStyle(
          dataModuleShape: QrDataModuleShape.square,
          color: AppColors.buttonBlue,
        ),
      ),
    );
  }
}

class _ProCameraPaymentDialog extends StatefulWidget {
  const _ProCameraPaymentDialog({required this.event, this.onViewEvent});

  final EventCheckoutData event;
  final VoidCallback? onViewEvent;

  @override
  State<_ProCameraPaymentDialog> createState() =>
      _ProCameraPaymentDialogState();
}

class _ProCameraPaymentDialogState extends State<_ProCameraPaymentDialog> {
  int _selectedMethod = 0;

  @override
  Widget build(BuildContext context) {
    return _DialogShell(
      padding: EdgeInsets.fromLTRB(20.w, 18.h, 20.w, 22.h),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _DialogHeader(
              title: 'Payment Method',
              subtitle: 'Complete your Pro Camera Setup',
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
                      fontFamily: AppFonts.arial,
                      fontSize: 14.sp,
                      color: AppColors.white.withValues(alpha: 0.75),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    r'$1000',
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
            SizedBox(height: 18.h),
            Text(
              'Saved Payment Methods',
              style: TextStyle(
                fontFamily: AppFonts.arial,
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
                fontFamily: AppFonts.arial,
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
              label: r'Pay $1000',
              onPressed: () {
                Get.back();
                AddCameraFlow.showSuccessScreen(
                  event: widget.event,
                  onViewEvent: widget.onViewEvent,
                );
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
                  fontFamily: AppFonts.arial,
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
                      fontFamily: AppFonts.arial,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontFamily: AppFonts.arial,
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
              fontFamily: AppFonts.arial,
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

class _AddEmailAddressDialog extends StatefulWidget {
  const _AddEmailAddressDialog({required this.event, this.onViewEvent});

  final EventCheckoutData event;
  final VoidCallback? onViewEvent;

  @override
  State<_AddEmailAddressDialog> createState() => _AddEmailAddressDialogState();
}

class _AddEmailAddressDialogState extends State<_AddEmailAddressDialog> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _DialogShell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _DialogHeader(title: 'Add Email Address'),
          SizedBox(height: 18.h),
          AppTextField(
            controller: _emailController,
            hintText: 'Add Email Address - Cam2',
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 10.h),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(3.w),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add_rounded,
                      color: AppColors.darkBlue,
                      size: 14.sp,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    'Add Another',
                    style: TextStyle(
                      fontFamily: AppFonts.arial,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white.withValues(alpha: 0.85),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 18.h),
          PrimaryButton(
            label: 'Add Now',
            onPressed: () {
              Get.back();
              AddCameraFlow.showSuccessScreen(
                event: widget.event,
                onViewEvent: widget.onViewEvent,
              );
            },
            height: 50.h,
            borderRadius: 30.r,
          ),
        ],
      ),
    );
  }
}
