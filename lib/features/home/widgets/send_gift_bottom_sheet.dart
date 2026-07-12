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

const standardGifts = [
  GiftItem(
    name: 'Roses',
    pack: '',
    price: '1',
    image: AssetImages.s1,
    stackColors: [Color(0xFF8B2020), Color(0xFF6E1818), Color(0xFF551212)],
  ),
  GiftItem(
    name: 'Thumbs Up',
    pack: '',
    price: '1',
    image: AssetImages.s2,
    stackColors: [Color(0xFFFF9500), Color(0xFFE68600), Color(0xFFCC7700)],
  ),
  GiftItem(
    name: 'Hand Claps',
    pack: '',
    price: '3',
    image: AssetImages.s3,
    stackColors: [Color(0xFF4A5568), Color(0xFF3D4F5F), Color(0xFF2F3E4D)],
  ),
  GiftItem(
    name: 'Headphones',
    pack: '',
    price: '5',
    image: AssetImages.s4,
    stackColors: [Color(0xFF4FC3F7), Color(0xFF29B6F6), Color(0xFF039BE5)],
  ),
  GiftItem(
    name: 'Microphone',
    pack: '',
    price: '5',
    image: AssetImages.s5,
    stackColors: [Color(0xFFFF00AA), Color(0xFFD90092), Color(0xFFB30078)],
  ),
  GiftItem(
    name: 'Kisses',
    pack: '',
    price: '100',
    image: AssetImages.s6,
    stackColors: [Color(0xFFFFB6C1), Color(0xFFFF9EB5), Color(0xFFFF87A9)],
  ),
  GiftItem(
    name: 'Hand Hearts',
    pack: '',
    price: '100',
    image: AssetImages.s7,
    stackColors: [Color(0xFF8A56D7), Color(0xFF6348E8), Color(0xFF4E38CC)],
  ),
  GiftItem(
    name: 'Assorted Chocolates',
    pack: '',
    price: '150',
    image: AssetImages.s8,
    stackColors: [Color(0xFFD2B48C), Color(0xFFC4A882), Color(0xFFB69C78)],
  ),
  GiftItem(
    name: 'Bouquet of Roses',
    pack: '',
    price: '200',
    image: AssetImages.s9,
    stackColors: [Color(0xFFFFB6C1), Color(0xFFFF9EB5), Color(0xFFFF87A9)],
  ),
  GiftItem(
    name: 'Hand Hearts',
    pack: '',
    price: '100',
    image: AssetImages.s10,
    stackColors: [Color(0xFF8A56D7), Color(0xFF6348E8), Color(0xFF4E38CC)],
  ),
  GiftItem(
    name: 'Assorted Chocolates',
    pack: '',
    price: '150',
    image: AssetImages.s11,
    stackColors: [Color(0xFFD2B48C), Color(0xFFC4A882), Color(0xFFB69C78)],
  ),
  GiftItem(
    name: 'Bouquet of Roses',
    pack: '',
    price: '200',
    image: AssetImages.s12,
    stackColors: [Color(0xFF008080), Color(0xFF006666), Color(0xFF004D4D)],
  ),
  GiftItem(
    name: 'Dancing Man',
    pack: '',
    price: '2,400',
    image: AssetImages.s13,
    stackColors: [Color(0xFFB8A9E6), Color(0xFFA090DC), Color(0xFF8878D2)],
  ),
  GiftItem(
    name: 'ShowMeLive Universe',
    pack: '',
    price: '1,000',
    image: AssetImages.s14,
    stackColors: [Color(0xFF333333), Color(0xFF2A2A2A), Color(0xFF222222)],
  ),
  GiftItem(
    name: 'Fireworks',
    pack: '',
    price: '2,000',
    image: AssetImages.s15,
    stackColors: [Color(0xFF0D4A4A), Color(0xFF083838), Color(0xFF052828)],
  ),
];

const featuredGift = GiftItem(
  name: 'Roaring Elephant',
  pack: '',
  price: '1,150',
  image: AssetImages.s16,
  stackColors: [Color(0xFF333333), Color(0xFF2A2A2A), Color(0xFF222222)],
);

const gifts = [...standardGifts, featuredGift];

class SendGiftBottomSheet extends StatelessWidget {
  const SendGiftBottomSheet({super.key});

  void _onGiftTap(GiftItem gift) {
    Get.back();
    showSendGiftConfirmDialog(gift);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 0.88.sh),
      decoration: BoxDecoration(
        color: const Color(0xFF00008B),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10.h),
            Container(
              width: 100.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(18.w, 16.h, 18.w, 0),
              child: Stack(
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
            ),
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(18.w, 22.h, 18.w, 24.h),
                child: Column(
                  children: [
                    _GiftGrid(gifts: standardGifts, onGiftTap: _onGiftTap),
                    10.verticalSpace,
                    // SizedBox(
                    //   height: 120.h,
                    //   child: ListView.separated(
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: _premiumGifts.length,
                    //     separatorBuilder: (_, __) => SizedBox(width: 14.w),
                    //     itemBuilder: (context, index) {
                    //       return GestureDetector(
                    //         onTap: () => _onGiftTap(_premiumGifts[index]),
                    //         child: PremiumGiftTile(gift: _premiumGifts[index]),
                    //       );
                    //     },
                    //   ),
                    // ),
                    GestureDetector(
                      onTap: () => _onGiftTap(featuredGift),
                      child: FeaturedGiftTile(gift: featuredGift),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GiftGrid extends StatelessWidget {
  const _GiftGrid({required this.gifts, required this.onGiftTap});

  final List<GiftItem> gifts;
  final ValueChanged<GiftItem> onGiftTap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: gifts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 30.h,
        crossAxisSpacing: 18.w,
        childAspectRatio: 0.55,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => onGiftTap(gifts[index]),
          child: GiftTile(gift: gifts[index]),
        );
      },
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
          child: _GiftStack(
            colors: gift.stackColors,
            image: gift.image,
            size: 120.w,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          gift.name,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: AppFonts.arial,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            height: 1.2,
            color: AppColors.white,
          ),
        ),
        SizedBox(height: 4.h),
        _CoinPrice(price: gift.price),
      ],
    );
  }
}

class PremiumGiftTile extends StatelessWidget {
  const PremiumGiftTile({super.key, required this.gift});

  final GiftItem gift;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96.w,
      child: Column(
        children: [
          _GiftStack(colors: gift.stackColors, image: gift.image, size: 64.w),
          SizedBox(height: 8.h),
          Text(
            gift.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: AppFonts.arial,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              height: 1.2,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 4.h),
          _CoinPrice(price: gift.price, fontSize: 12.sp),
        ],
      ),
    );
  }
}

class FeaturedGiftTile extends StatelessWidget {
  const FeaturedGiftTile({super.key, required this.gift});

  final GiftItem gift;

  @override
  Widget build(BuildContext context) {
    final cardHeight = 190.h;
    final offset = 8.w;
    const stackDepth = 2;
    final imageOverflow = 20.h;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: cardHeight + offset * stackDepth + imageOverflow,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomRight,
            children: [
              Positioned(
                top: imageOverflow,
                left: 0,
                right: offset * stackDepth,
                child: _FeaturedLayer(
                  height: cardHeight,
                  color: gift.stackColors[2],
                ),
              ),
              Positioned(
                top: imageOverflow + offset,
                left: offset,
                right: offset,
                child: _FeaturedLayer(
                  height: cardHeight,
                  color: gift.stackColors[1],
                ),
              ),
              Positioned(
                top: imageOverflow + offset * stackDepth,
                left: offset * stackDepth,
                right: 0,
                child: _FeaturedLayer(
                  height: cardHeight,
                  color: gift.stackColors[0],
                  showShadow: true,
                ),
              ),
              Positioned(
                top: 0,
                left: offset * stackDepth,
                right: 0,
                height: cardHeight + offset * stackDepth + imageOverflow,
                child: Center(
                  child: Image.asset(
                    gift.image,
                    fit: BoxFit.contain,
                    height: cardHeight + imageOverflow + 10.h,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          gift.name,
          style: TextStyle(
            fontFamily: AppFonts.arial,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
        SizedBox(height: 4.h),
        _CoinPrice(price: gift.price),
      ],
    );
  }
}

class _FeaturedLayer extends StatelessWidget {
  const _FeaturedLayer({
    required this.height,
    required this.color,
    this.showShadow = false,
  });

  final double height;
  final Color color;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
    );
  }
}

class _CoinPrice extends StatelessWidget {
  const _CoinPrice({required this.price, this.fontSize});

  final String price;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AssetImages.coin, width: 20.w, height: 20.h),
        SizedBox(width: 4.w),
        Text(
          price,
          style: TextStyle(
            fontFamily: AppFonts.arial,
            fontSize: fontSize ?? 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}

class _CoinStackIcon extends StatelessWidget {
  const _CoinStackIcon();

  @override
  Widget build(BuildContext context) {
    final size = 14.w;
    return SizedBox(
      width: size + 8.w,
      height: size + 2.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            top: 2.h,
            child: _coin(size, const Color(0xFFE6B422)),
          ),
          Positioned(
            left: 4.w,
            top: 0,
            child: _coin(size, const Color(0xFFF2C94C)),
          ),
          Positioned(
            left: 8.w,
            top: 2.h,
            child: _coin(size, const Color(0xFFD4A017)),
          ),
        ],
      ),
    );
  }

  Widget _coin(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFFFF2B2), width: 0.8),
      ),
    );
  }
}

class _GiftStack extends StatelessWidget {
  const _GiftStack({
    required this.colors,
    required this.image,
    required this.size,
  });

  final List<Color> colors;
  final String image;
  final double size;

  @override
  Widget build(BuildContext context) {
    const stackDepth = 2;
    final offset = 3.5.w;

    return SizedBox(
      width: size + offset * stackDepth,
      height: size + offset * stackDepth,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topLeft,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: _StackLayer(color: colors[2], size: size),
          ),
          Positioned(
            top: offset,
            left: offset,
            child: _StackLayer(color: colors[1], size: size),
          ),
          Positioned(
            top: offset * stackDepth,
            left: offset * stackDepth,
            child: _StackLayer(
              color: colors[0],
              size: size,
              child: Padding(
                padding: EdgeInsets.all(size * 0.12),
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
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: child != null
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: child != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(14.r),
              child: Center(child: child),
            )
          : null,
    );
  }
}
