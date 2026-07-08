import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:show_me_live/core/theme/assets_images.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({
    super.key,
    required this.child,
    this.blurBackground = false,
  });

  final Widget child;
  final bool blurBackground;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(AssetImages.splashBg, fit: BoxFit.cover),
        if (blurBackground)
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: const SizedBox.expand(),
            ),
          ),
        // Container(
        //   decoration: const BoxDecoration(
        //     gradient: AppColors.backgroundGradient,
        //   ),
        // ),
        child,
      ],
    );
  }
}
