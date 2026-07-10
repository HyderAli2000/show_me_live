import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_images.dart';
import 'package:show_me_live/core/widgets/app_background.dart';
import 'package:show_me_live/features/auth/screens/create_profile.dart';
import 'package:show_me_live/features/auth/screens/reset_password_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({
    super.key,
    this.email,
    this.isForgotPassword = false,
  });

  final String? email;
  final bool isForgotPassword;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final CountDownController _controller = CountDownController();

  bool complete = false;
  bool _openedNext = false;

  final int _duration = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller.start();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _onOtpCompleted(String pin) {
    if (_openedNext) return;
    if (pin.length < 6) return;

    _openedNext = true;
    FocusScope.of(context).unfocus();

    // TODO: Replace with your real next step (e.g. Create profile / reset password).
    Get.to(
      () => widget.isForgotPassword
          ? const ResetPasswordScreen()
          : const CreateProfileScreen(),
    );
  }

  void _onResend() {
    setState(() {
      complete = false;
      _openedNext = false;
    });
    _controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundDark,
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
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: AppBackground(
          blurBackground: false,
          child: SafeArea(
            bottom: true,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetImages.logo,
                    width: 270.w,
                    height: 120.h,
                    fit: BoxFit.contain,
                  ),
                ),
                10.verticalSpace,

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 18.w),
                  height: 0.6.sh,
                  padding: EdgeInsets.fromLTRB(20.w, 26.h, 20.w, 56.h),
                  decoration: BoxDecoration(
                    color: const Color(0xff03031F),
                    borderRadius: BorderRadius.circular(26.r),
                    border: Border.all(color: AppColors.darkBlue),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'OTP Verification',
                        style: TextStyle(
                          fontFamily: AppFonts.arial,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'We have sent you an email containing 6 digits\nverification code. Please enter the code to verify your identity',
                        style: TextStyle(
                          fontFamily: AppFonts.arial,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white.withValues(alpha: 0.55),
                          height: 1.35,
                        ),
                      ),

                      SizedBox(height: 22.h),

                      PinCodeTextField(
                        appContext: context,
                        length: 6,
                        keyboardType: TextInputType.number,
                        enableActiveFill: true,
                        animationType: AnimationType.fade,

                        pinTheme: PinTheme(
                          borderRadius: BorderRadius.circular(10.r),
                          shape: PinCodeFieldShape.circle,
                          fieldHeight: 52.h,
                          fieldWidth: 52.w,
                          borderWidth: 1,
                          inactiveBorderWidth: 1,
                          activeBorderWidth: 1,
                          selectedBorderWidth: 2,
                          inactiveFillColor: AppColors.darkBlue.withValues(
                            alpha: 0.2,
                          ),
                          inactiveColor: AppColors.white.withValues(alpha: 0.4),
                          activeFillColor: AppColors.darkBlue.withValues(
                            alpha: 0.2,
                          ),
                          activeColor: AppColors.darkBlue.withValues(
                            alpha: 0.2,
                          ),
                          selectedFillColor: AppColors.darkBlue.withValues(
                            alpha: 0.2,
                          ),
                          selectedColor: AppColors.darkBlue.withValues(
                            alpha: 0.2,
                          ),
                        ),
                        cursorColor: AppColors.darkBlue,
                        textStyle: TextStyle(
                          fontFamily: AppFonts.arial,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                        onCompleted: _onOtpCompleted,
                        onChanged: (_) {},
                      ),

                      SizedBox(height: 22.h),

                      Center(
                        child: CircularCountDownTimer(
                          duration: _duration,
                          initialDuration: 0,
                          controller: _controller,
                          width: 124.w,
                          height: 124.h,
                          ringColor: Colors.transparent,
                          fillColor: AppColors.darkBlue,
                          backgroundColor: AppColors.white.withValues(
                            alpha: 0.12,
                          ),
                          strokeWidth: 6.0,
                          strokeCap: StrokeCap.round,
                          textStyle: TextStyle(
                            fontFamily: AppFonts.arial,
                            fontSize: 18.sp,
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                          ),
                          textFormat: CountdownTextFormat.MM_SS,
                          isReverse: true,
                          isReverseAnimation: true,
                          isTimerTextShown: true,
                          autoStart: true,
                          onComplete: () {
                            if (!mounted) return;
                            setState(() => complete = true);
                          },
                          onChange: (_) {},
                        ),
                      ),
                    ],
                  ),
                ),

                20.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't received the code?",
                        style: TextStyle(
                          fontFamily: AppFonts.arial,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white.withValues(alpha: 0.55),
                        ),
                      ),
                      SizedBox(width: 6.w),
                      GestureDetector(
                        onTap: complete ? _onResend : null,
                        child: Text(
                          'Resend',
                          style: TextStyle(
                            fontFamily: AppFonts.arial,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white.withValues(
                              alpha: complete ? 0.95 : 0.35,
                            ),
                            decoration: TextDecoration.underline,
                            decorationThickness: 1.2,
                          ),
                        ),
                      ),
                    ],
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
