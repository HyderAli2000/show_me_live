import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_images.dart';
import 'package:show_me_live/features/home/models/gift_item.dart';
import 'package:show_me_live/features/home/widgets/send_gift_confirm_dialog.dart';

void showSendGiftBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => const SendGiftBottomSheet(),
  );
}

const gifts = [
  GiftItem(
    name: 'Like',
    pack: '10 pack',
    price: '\$5',
    image: AssetImages.s1,
    stackColors: [Color(0xFF7B5CFF), Color(0xFF6348E8), Color(0xFF4E38CC)],
  ),
  GiftItem(
    name: 'Cheers',
    pack: '10 pack',
    price: '\$7',
    image: AssetImages.s2,
    stackColors: [Color(0xFF5C1A3A), Color(0xFF4A1530), Color(0xFF3A1028)],
  ),
  GiftItem(
    name: 'Spotlight',
    pack: '10 pack',
    price: '\$10',
    image: AssetImages.s3,
    stackColors: [Color(0xFF8B2020), Color(0xFF6E1818), Color(0xFF551212)],
  ),
  GiftItem(
    name: 'Encore',
    pack: '10 pack',
    price: '\$15',
    image: AssetImages.s4,
    stackColors: [Color(0xFFFFD700), Color(0xFFE6C200), Color(0xFFCCAD00)],
  ),
  GiftItem(
    name: 'Headliner',
    pack: '1',
    price: '\$20',
    image: AssetImages.s5,
    stackColors: [Color(0xFFFF00AA), Color(0xFFD90092), Color(0xFFB30078)],
  ),
];

class SendGiftBottomSheet extends StatelessWidget {
  const SendGiftBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [const Color(0xFF120A45), const Color(0xFF0A0640)],
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
              SizedBox(height: 16.h),
              Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    'Send a Gift',
                    style: TextStyle(
                      fontFamily: AppFonts.arial,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.close,
                        color: AppColors.white,
                        size: 22.w,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 22.h),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: gifts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20.h,
                  crossAxisSpacing: 12.w,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.back();
                      showSendGiftConfirmDialog(gifts[index]);
                    },
                    child: GiftTile(gift: gifts[index]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GiftTile extends StatelessWidget {
  const GiftTile({super.key, required this.gift});

  final GiftItem gift;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: _GiftStack(colors: gift.stackColors, image: gift.image),
        ),
        SizedBox(height: 10.h),
        Text(
          '${gift.name} (${gift.pack})',
          textAlign: TextAlign.center,
          maxLines: 2,
          style: TextStyle(
            fontFamily: AppFonts.arial,
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            height: 1.25,
            color: AppColors.white,
          ),
        ),
        SizedBox(height: 3.h),
        Text(
          gift.price,
          style: TextStyle(
            fontFamily: AppFonts.arial,
            fontSize: 13.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.white.withValues(alpha: 0.85),
          ),
        ),
      ],
    );
  }
}

class _GiftStack extends StatelessWidget {
  const _GiftStack({required this.colors, required this.image});

  final List<Color> colors;
  final String image;

  @override
  Widget build(BuildContext context) {
    final size = 90.w;
    const stackDepth = 2;
    final offset = 4.w;

    return SizedBox(
      width: size + offset * stackDepth,
      height: size + offset * stackDepth,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topLeft,
        children: [
          // Back layer — peeks from top-left
          Positioned(
            top: 0,
            left: 0,
            child: _StackLayer(color: colors[2], size: size),
          ),
          // Middle layer
          Positioned(
            top: offset,
            left: offset,
            child: _StackLayer(color: colors[1], size: size),
          ),
          // Front layer with gift image — shifted down-right
          Positioned(
            top: offset * stackDepth,
            left: offset * stackDepth,
            child: _StackLayer(
              color: colors[0],
              size: size,
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Image.asset(image, fit: BoxFit.contain),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StackLayer extends StatelessWidget {
  const _StackLayer({required this.color, required this.size, this.child});

  final Color color;
  final double size;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: child != null
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ]
            : null,
      ),
      child: child != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Center(child: child),
            )
          : null,
    );
  }
}
