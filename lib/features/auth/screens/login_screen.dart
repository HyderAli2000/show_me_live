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
import 'package:show_me_live/features/auth/screens/forgot_password_screen.dart';
import 'package:show_me_live/features/auth/screens/signup_screen.dart';
import 'package:show_me_live/navbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: AppBackground(
        blurBackground: false,
        child: SafeArea(
          bottom: true,
          child: Column(
            children: [
              SizedBox(height: 22.h),
              Center(
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
                      color: Color(0xff03031F),
                      borderRadius: BorderRadius.circular(26.r),
                      border: Border.all(color: AppColors.darkBlue),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Login',
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
                        const AppTextField(
                          hintText: 'Enter Email Address',
                          keyboardType: TextInputType.emailAddress,
                          prefixIconAsset: AssetIcons.email,
                        ),
                        SizedBox(height: 14.h),
                        const AppTextField(
                          hintText: 'Enter Password',
                          prefixIconAsset: AssetIcons.lock,
                          enablePasswordToggle: true,
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              activeColor: AppColors.darkBlue,
                              side: BorderSide(
                                color: AppColors.white.withValues(alpha: 0.55),
                              ),
                              onChanged: (v) {
                                setState(() => _rememberMe = v ?? false);
                              },
                            ),
                            Text(
                              'Remember me',
                              style: TextStyle(
                                fontFamily: AppFonts.satoshi,
                                fontSize: 13.sp,
                                color: AppColors.white.withValues(alpha: 0.35),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const ForgotPasswordScreen());
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontFamily: AppFonts.satoshi,
                                  fontSize: 13.sp,
                                  color: AppColors.white.withValues(
                                    alpha: 0.55,
                                  ),
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 1.2,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 18.h),
                        PrimaryButton(
                          label: 'Login',
                          onPressed: () {
                            Get.offAll(() => const Navbar());
                          },
                          backgroundColor: AppColors.buttonBlue,
                          height: 52.h,
                          borderRadius: 30.r,
                        ),
                        SizedBox(height: 18.h),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: AppFonts.satoshi,
                                fontSize: 12.5.sp,
                                color: AppColors.white.withValues(alpha: 0.55),
                              ),
                              children: [
                                const TextSpan(
                                  text: 'Don\'t have an account? ',
                                ),
                                TextSpan(
                                  text: 'Sign Up',
                                  style: TextStyle(
                                    color: AppColors.white.withValues(
                                      alpha: 0.85,
                                    ),
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 1.2,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.to(() => const SignupScreen());
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 18.h),
                        Row(
                          children: [
                            10.horizontalSpace,
                            Expanded(child: Divider(color: AppColors.divider)),
                            10.horizontalSpace,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Text(
                                'Or',
                                style: TextStyle(
                                  fontFamily: AppFonts.satoshi,
                                  fontSize: 22.sp,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                            10.horizontalSpace,
                            Expanded(child: Divider(color: AppColors.divider)),
                            10.horizontalSpace,
                          ],
                        ),
                        SizedBox(height: 14.h),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 44.h,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.appleGray,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        99999999.r,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        AssetIcons.apple,
                                        width: 25.w,
                                        height: 25.h,
                                      ),
                                      SizedBox(width: 10.w),
                                      Text(
                                        'With Apple',
                                        style: TextStyle(
                                          fontFamily: AppFonts.satoshi,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 14.w),
                            Expanded(
                              child: SizedBox(
                                height: 44.h,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.googleRed,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        99999999.r,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        AssetIcons.google,
                                        width: 25.w,
                                        height: 25.h,
                                      ),
                                      SizedBox(width: 10.w),
                                      Text(
                                        'With Google',
                                        style: TextStyle(
                                          fontFamily: AppFonts.satoshi,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 18.h),
                      ],
                    ),
                  ),
                ),
              ),

              Center(
                child: Text(
                  'By signing up you agree to our',
                  style: TextStyle(
                    fontFamily: AppFonts.satoshi,
                    fontSize: 11.5.sp,
                    color: AppColors.white.withValues(alpha: 0.62),
                  ),
                ),
              ),
              5.verticalSpace,
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: AppFonts.satoshi,
                    fontSize: 13.sp,
                    color: AppColors.white.withValues(alpha: 0.62),
                    height: 1.25,
                  ),
                  children: [
                    TextSpan(
                      text: 'Terms & Conditions',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationThickness: 1.2,
                        color: AppColors.white,
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
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationThickness: 1.2,
                        color: AppColors.white,
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
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
