import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:show_me_live/core/theme/app_theme.dart';
import 'package:show_me_live/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Show Me Live',
      transitionDuration: const Duration(milliseconds: 500),
      defaultTransition: Transition.cupertino,
      locale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: ScreenUtilInit(
        designSize: const Size(430, 932),
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return LayoutBuilder(
            builder: (context, constraints) {
              // final screenWidth = constraints.maxWidth;

              // // Agar tablet hai (jaise iPad)
              // if (screenWidth > 600) {
              //   // Adjust base design for larger screens
              //   ScreenUtil.init(
              //     context,
              //     designSize: const Size(834, 1194), // iPad Air 10.9"
              //   );
              // }
              return MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: const TextScaler.linear(1.01)),
                child: SafeArea(
                  top: false,
                  bottom: true,
                  left: true,
                  right: true,
                  child: const SplashScreen(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
