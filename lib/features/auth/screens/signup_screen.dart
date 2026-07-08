import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_icons.dart';
import 'package:show_me_live/core/theme/assets_images.dart';
import 'package:show_me_live/core/widgets/app_background.dart';
import 'package:show_me_live/core/widgets/app_text_field.dart';
import 'package:show_me_live/core/widgets/primary_button.dart';
import 'package:show_me_live/features/auth/screens/agreements_screen.dart';
import 'package:show_me_live/features/auth/screens/login_screen.dart';
import 'package:show_me_live/features/auth/screens/otp_verification_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Container(
                    padding: EdgeInsets.all(18.w),
                    decoration: BoxDecoration(
                      color: const Color(0xff03031F),
                      borderRadius: BorderRadius.circular(26.r),
                      border: Border.all(color: AppColors.darkBlue),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Sign up',
                          style: TextStyle(
                            fontFamily: AppFonts.tactic,
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Enter your Credentials',
                          style: TextStyle(
                            fontFamily: AppFonts.satoshi,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white.withValues(alpha: 0.55),
                          ),
                        ),
                        SizedBox(height: 18.h),
                        AppTextField(
                          hintText: 'Enter Email Address',
                          keyboardType: TextInputType.emailAddress,
                          prefixIconAsset: AssetIcons.email,
                          fillColor: AppColors.darkBlue.withValues(alpha: 0.2),
                          borderColor: Colors.white.withValues(alpha: 0.55),
                        ),
                        SizedBox(height: 14.h),
                        AppTextField(
                          hintText: 'Enter Password',
                          prefixIconAsset: AssetIcons.lock,
                          enablePasswordToggle: true,
                          fillColor: AppColors.darkBlue.withValues(alpha: 0.2),
                          borderColor: Colors.white.withValues(alpha: 0.55),
                        ),
                        SizedBox(height: 14.h),
                        AppTextField(
                          hintText: 'Confirm Password',
                          prefixIconAsset: AssetIcons.lock,
                          enablePasswordToggle: true,
                          fillColor: AppColors.darkBlue.withValues(alpha: 0.2),
                          borderColor: Colors.white.withValues(alpha: 0.55),
                        ),
                        SizedBox(height: 18.h),
                        Row(
                          children: [
                            Checkbox(
                              visualDensity: VisualDensity.compact,
                              value: _rememberMe,
                              activeColor: AppColors.darkBlue,
                              side: BorderSide(
                                color: AppColors.white.withValues(alpha: 0.55),
                              ),
                              onChanged: (v) {
                                setState(() => _rememberMe = v ?? false);
                              },
                            ),
                            Expanded(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: TextStyle(
                                    fontFamily: AppFonts.satoshi,
                                    fontSize: 13.sp,
                                    color: AppColors.white.withValues(
                                      alpha: 0.65,
                                    ),
                                    height: 1.25,
                                  ),
                                  children: [
                                    const TextSpan(text: 'I agree with the '),
                                    TextSpan(
                                      text: 'Terms & Conditions',
                                      style:
                                          TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w600,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationThickness: 1.2,
                                          ).copyWith(
                                            color: AppColors.white.withValues(
                                              alpha: 0.85,
                                            ),
                                          ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.to(
                                            () => const AgreementsScreen(
                                              initialTab: AgreementsTab.terms,
                                            ),
                                          );
                                        },
                                    ),
                                    const TextSpan(text: ' & '),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style:
                                          TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w600,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationThickness: 1.2,
                                          ).copyWith(
                                            color: AppColors.white.withValues(
                                              alpha: 0.85,
                                            ),
                                          ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.to(
                                            () => const AgreementsScreen(
                                              initialTab: AgreementsTab.privacy,
                                            ),
                                          );
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 18.h),
                        PrimaryButton(
                          label: 'Sign up',
                          onPressed: () {
                            Get.to(() => const OtpVerificationScreen());
                          },
                          backgroundColor: AppColors.buttonBlue,
                          height: 52.h,
                          borderRadius: 30.r,
                        ),
                        SizedBox(height: 18.h),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: AppFonts.satoshi,
                      fontSize: 14.sp,
                      color: AppColors.white.withValues(alpha: 0.55),
                    ),
                    children: [
                      const TextSpan(text: 'Already have an account? '),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white.withValues(alpha: 0.85),
                          decoration: TextDecoration.underline,
                          decorationThickness: 1.2,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(() => const LoginScreen());
                          },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
