import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_images.dart';
import 'package:show_me_live/features/events/screens/create_event_screen.dart';
import 'package:show_me_live/features/home/models/gift_item.dart';
import 'package:show_me_live/features/home/screens/my_collection.dart';
import 'package:show_me_live/features/home/widgets/gift_purchase_flow.dart';
import 'package:show_me_live/features/home/widgets/send_gift_bottom_sheet.dart';
import 'package:show_me_live/features/home/widgets/send_gift_confirm_dialog.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int _selectedTab = 0;

  static const _tabs = ['Transactions', 'Store'];

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

  static const _transactions = [
    _TransactionItem(
      description: 'Amount transferred to your Wallet',
      date: 'April 22, 2026 - 10:40pm',
      status: 'Credit',
    ),
    _TransactionItem(
      description: 'Amount transferred to your Wallet',
      date: 'April 22, 2026 - 10:40pm',
      status: 'Credit',
    ),
    _TransactionItem(
      description: 'Amount transferred to your Wallet',
      date: 'April 22, 2026 - 10:40pm',
      status: 'Credit',
    ),
    _TransactionItem(
      description: 'Amount transferred to your Wallet',
      date: 'April 22, 2026 - 10:40pm',
      status: 'Credit',
    ),
    _TransactionItem(
      description: 'Amount transferred to your Wallet',
      date: 'April 22, 2026 - 10:40pm',
      status: 'Credit',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(18.w, 8.h, 18.w, 120.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _BalanceCard(),
            SizedBox(height: 22.h),
            _WalletSegmentedTabBar(
              tabs: _tabs,
              selectedIndex: _selectedTab,
              onChanged: (index) => setState(() => _selectedTab = index),
            ),
            SizedBox(height: 20.h),
            if (_selectedTab == 0)
              const _TransactionsTab(transactions: _transactions)
            else
              _StoreTab(stickerPacks: _stickerPacks),
          ],
        ),
      ),

      floatingActionButton: GestureDetector(
        onTap: () => Get.to(() => const CreateEventScreen()),
        child: Container(
          width: 50.w,
          height: 50.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              stops: const [0.0, 0.3, 1.0],
              colors: [
                AppColors.fabGradientStart,
                AppColors.fabGradientStart,
                AppColors.fabGradientEnd,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryBlue.withValues(alpha: 0.35),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Icon(Icons.add, size: 24.sp, color: AppColors.darkBlue),
        ),
      ),
    );
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 28.h),
      decoration: BoxDecoration(
        color: Color(0xff6155F9),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.buttonBlue.withValues(alpha: 0.35),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '\$185',
            style: TextStyle(
              fontFamily: AppFonts.tactic,
              fontSize: 40.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            'Amount Available',
            style: TextStyle(
              fontFamily: AppFonts.satoshi,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _WalletSegmentedTabBar extends StatelessWidget {
  const _WalletSegmentedTabBar({
    required this.tabs,
    required this.selectedIndex,
    required this.onChanged,
  });

  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: const Color(0xFF09062B),
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final selected = selectedIndex == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: selected ? AppColors.buttonBlue : Colors.transparent,
                  borderRadius: BorderRadius.circular(26.r),
                ),
                child: Text(
                  tabs[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppFonts.satoshi,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: selected
                        ? AppColors.white
                        : AppColors.white.withValues(alpha: 0.45),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _TransactionsTab extends StatelessWidget {
  const _TransactionsTab({required this.transactions});

  final List<_TransactionItem> transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 48.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: AppColors.inputFill.withValues(alpha: 0.85),
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(
                    color: AppColors.primaryBlue.withValues(alpha: 0.45),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search_rounded,
                      color: AppColors.white.withValues(alpha: 0.55),
                      size: 22.sp,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Search...',
                      style: TextStyle(
                        fontFamily: AppFonts.satoshi,
                        fontSize: 14.sp,
                        color: AppColors.white.withValues(alpha: 0.45),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: AppColors.buttonBlue,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.buttonBlue.withValues(alpha: 0.45),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                Icons.add_rounded,
                color: AppColors.white,
                size: 26.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        ...transactions.map(
          (item) => Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: _TransactionCard(item: item),
          ),
        ),
      ],
    );
  }
}

class _StoreTab extends StatelessWidget {
  const _StoreTab({required this.stickerPacks});

  final List<GiftItem> stickerPacks;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Get.to(() => const MyCollectionScreen()),
          child: SizedBox(
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
                                  fontFamily: AppFonts.satoshi,
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                ),
                              ),
                              TextSpan(
                                text: 'Packs',
                                style: TextStyle(
                                  fontFamily: AppFonts.satoshi,
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
                            fontFamily: AppFonts.satoshi,
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
        ),
        SizedBox(height: 22.h),
        Text(
          'Buy Sticker Packs',
          style: TextStyle(
            fontFamily: AppFonts.tactic,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
        SizedBox(height: 16.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: gifts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 20.h,
            crossAxisSpacing: 12.w,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                GiftPurchaseFlow.showPaymentDialog(gift: stickerPacks[index]);
              },
              child: GiftTile(gift: stickerPacks[index]),
            );
          },
        ),
      ],
    );
  }
}

class CollectionPreview extends StatelessWidget {
  const CollectionPreview({
    required this.color,
    required this.image,
    required this.size,
  });

  final Color color;
  final String image;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(size * 0.12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.35),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Image.asset(image, fit: BoxFit.contain),
    );
  }
}

class _TransactionCard extends StatelessWidget {
  const _TransactionCard({required this.item});

  final _TransactionItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: const Color(0xFF09062B),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Color(0xffA0A0A0).withValues(alpha: 0.15),
            blurRadius: 8,
            offset: const Offset(0, 1),
          ),
        ],
        // border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.description,
                  style: TextStyle(
                    fontFamily: AppFonts.satoshi,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff6155F9),
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  item.date,
                  style: TextStyle(
                    fontFamily: AppFonts.satoshi,
                    fontSize: 14.sp,
                    color: AppColors.white.withValues(alpha: 0.45),
                  ),
                ),
              ],
            ),
          ),
          Text(
            item.status,
            style: TextStyle(
              fontFamily: AppFonts.satoshi,
              fontSize: 14.sp,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _TransactionItem {
  const _TransactionItem({
    required this.description,
    required this.date,
    required this.status,
  });

  final String description;
  final String date;
  final String status;
}
