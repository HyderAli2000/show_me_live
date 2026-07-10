import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_images.dart';
import 'package:show_me_live/features/home/models/gift_item.dart';
import 'package:show_me_live/features/home/screens/wallet_screen.dart';
import 'package:show_me_live/features/home/widgets/send_gift_bottom_sheet.dart';

enum AgreementsTab { terms, privacy }

class MyCollectionScreen extends StatefulWidget {
  const MyCollectionScreen({super.key});

  @override
  State<MyCollectionScreen> createState() => _MyCollectionScreenState();
}

class _MyCollectionScreenState extends State<MyCollectionScreen> {
  static const _stickerPacks = [
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
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetImages.allBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                color: AppColors.darkBlue,
              ),
            ),
          ),
          title: Text(
            'My Collections',
            style: TextStyle(
              fontFamily: AppFonts.arial,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          bottom: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130.h,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        top: 0.h,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.fromLTRB(18.w, 16.h, 110.w, 16.h),
                          decoration: BoxDecoration(
                            color: const Color(0xFF252047),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '03 ',
                                      style: TextStyle(
                                        fontFamily: AppFonts.arial,
                                        fontSize: 32.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Packs',
                                      style: TextStyle(
                                        fontFamily: AppFonts.arial,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                'Your Collections',
                                style: TextStyle(
                                  fontFamily: AppFonts.arial,
                                  fontSize: 14.sp,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        right: 65.w,
                        bottom: 10.h,
                        child: Transform.rotate(
                          angle: -0.18,
                          child: CollectionPreview(
                            size: 90.w,
                            color: const Color(0xFF5C1A3A),
                            image: AssetImages.s5,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 20.w,
                        bottom: 0.h,
                        child: Transform.rotate(
                          angle: 0.35,
                          child: CollectionPreview(
                            size: 90.w,
                            color: const Color(0xFF7B5CFF),
                            image: AssetImages.s1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 22.h),
                Text(
                  'My Stickers',
                  style: TextStyle(
                    fontFamily: AppFonts.arial,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 16.h),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _stickerPacks.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 12.w,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    return GiftTile(gift: _stickerPacks[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
