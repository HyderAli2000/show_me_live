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
              _StoreTab(stickerPacks: standardGifts),
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
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 28.h),
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
      child: Row(
        children: [
          Image.asset(AssetImages.coin, width: 80.w, height: 80.h),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1,584',
                style: TextStyle(
                  fontFamily: AppFonts.arial,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                'Coins Available',
                style: TextStyle(
                  fontFamily: AppFonts.arial,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ],
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
                    fontFamily: AppFonts.arial,
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
                        fontFamily: AppFonts.arial,
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

class _StoreTab extends StatefulWidget {
  const _StoreTab({required this.stickerPacks});

  final List<GiftItem> stickerPacks;

  @override
  State<_StoreTab> createState() => _StoreTabState();
}

class _StoreTabState extends State<_StoreTab> {
  int _selectedSubTab = 0;

  static const _subTabs = ['Stickers', 'Coins'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StoreSubTabBar(
          tabs: _subTabs,
          selectedIndex: _selectedSubTab,
          onChanged: (index) => setState(() => _selectedSubTab = index),
        ),
        SizedBox(height: 18.h),
        if (_selectedSubTab == 0)
          _StickersStorePanel(stickerPacks: widget.stickerPacks)
        else
          const _CoinsStorePanel(),
      ],
    );
  }
}

class _StoreSubTabBar extends StatelessWidget {
  const _StoreSubTabBar({
    required this.tabs,
    required this.selectedIndex,
    required this.onChanged,
  });

  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: List.generate(tabs.length, (index) {
            final selected = selectedIndex == index;
            return Expanded(
              child: GestureDetector(
                onTap: () => onChanged(index),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    tabs[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppFonts.arial,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: selected
                          ? AppColors.primaryBlue
                          : AppColors.white.withValues(alpha: 0.45),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
        Stack(
          children: [
            Container(
              height: 1,
              color: AppColors.white.withValues(alpha: 0.12),
            ),
            AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              alignment: selectedIndex == 0
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: FractionallySizedBox(
                widthFactor: 0.5,
                child: Container(height: 2, color: AppColors.primaryBlue),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StickersStorePanel extends StatelessWidget {
  const _StickersStorePanel({required this.stickerPacks});

  final List<GiftItem> stickerPacks;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Get.to(() => const MyCollectionScreen()),
          child: SizedBox(
            height: 150.h,
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
                    padding: EdgeInsets.fromLTRB(18.w, 16.h, 138.w, 16.h),
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
                  right: 90.w,
                  bottom: 8.h,
                  child: Transform.rotate(
                    angle: -0.18,
                    child: CollectionPreview(
                      size: 115.w,
                      color: const Color(0xFFA9AA9F),
                      image: AssetImages.s16,
                    ),
                  ),
                ),
                Positioned(
                  right: 12.w,
                  bottom: -4.h,
                  child: Transform.rotate(
                    angle: 0.35,
                    child: CollectionPreview(
                      size: 115.w,
                      color: const Color(0xFF7B5CFF),
                      image: AssetImages.s2,
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
          itemCount: stickerPacks.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 30.h,
            crossAxisSpacing: 18.w,
            childAspectRatio: 0.55,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                GiftPurchaseFlow.showGiftPaymentDialog(
                  gift: stickerPacks[index],
                );
              },
              child: GiftTile(gift: stickerPacks[index]),
            );
          },
        ),
        GestureDetector(
          onTap: () {
            showSendGiftConfirmDialog(featuredGift);
          },
          child: FeaturedGiftTile(gift: featuredGift),
        ),
      ],
    );
  }
}

class _CoinPack {
  const _CoinPack({required this.coins, required this.price});

  final String coins;
  final String price;
}

class _CoinsStorePanel extends StatelessWidget {
  const _CoinsStorePanel();

  static const _coinPacks = [
    _CoinPack(coins: '50', price: r'$0.50'),
    _CoinPack(coins: '325', price: r'$3.00'),
    _CoinPack(coins: '645', price: r'$6.00'),
    _CoinPack(coins: '120', price: r'$12.00'),
    _CoinPack(coins: '1500', price: r'$16.00'),
    _CoinPack(coins: '3500', price: r'$35.00'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Buy Coins',
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
          itemCount: _coinPacks.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 14.h,
            crossAxisSpacing: 14.w,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final pack = _coinPacks[index];
            return GestureDetector(
              onTap: () {
                GiftPurchaseFlow.showPaymentDialog(
                  amount: pack.price,
                  subtitle: 'Complete your coin purchase',
                  onPaid: () =>
                      GiftPurchaseFlow.showCoinSuccessScreen(coins: pack.coins),
                );
              },
              child: _CoinPackCard(pack: pack),
            );
          },
        ),
      ],
    );
  }
}

class _CoinPackCard extends StatelessWidget {
  const _CoinPackCard({required this.pack});

  final _CoinPack pack;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(14.w, 16.h, 14.w, 18.h),
      decoration: BoxDecoration(
        color: const Color(0xFF6155F9).withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 120.h,
            child: Image.asset(
              AssetImages.coin,
              height: 104.h,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '${pack.coins} Coins',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: AppFonts.arial,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            pack.price,
            style: TextStyle(
              fontFamily: AppFonts.arial,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.white.withValues(alpha: 0.85),
            ),
          ),
        ],
      ),
    );
  }
}

class CollectionPreview extends StatelessWidget {
  const CollectionPreview({
    super.key,
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
                    fontFamily: AppFonts.arial,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff6155F9),
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  item.date,
                  style: TextStyle(
                    fontFamily: AppFonts.arial,
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
              fontFamily: AppFonts.arial,
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
