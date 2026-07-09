import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_icons.dart';
import 'package:show_me_live/core/theme/assets_images.dart';
import 'package:show_me_live/features/events/models/event_checkout_data.dart';
import 'package:show_me_live/features/home/screens/created_event_detail.dart';
import 'package:show_me_live/features/home/screens/purchased_event_detail.dart';

enum EventListCategory {
  purchasedUpcoming,
  purchasedLive,
  purchasedPast,
  createdUpcoming,
  createdLive,
  createdPast,
}

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  int _primaryTabIndex = 0;
  int _purchasedSubTabIndex = 0;
  int _createdSubTabIndex = 0;

  static const _primaryTabs = ['Purchased Details', 'Created Events'];
  static const _subTabs = ['Upcoming', 'Live', 'Past'];

  static const _purchasedUpcomingEvents = <_EventListItem>[
    _EventListItem(
      image: AssetImages.eve1,
      title: 'Lorem ipsum dolor sit amet, consectetur.',
      date: 'May 15, 2026',
      price: r'$25.2',
    ),
    _EventListItem(
      image: AssetImages.live,
      title: 'Lorem ipsum dolor sit amet, consectetur.',
      date: 'May 15, 2026',
      price: r'$25.2',
    ),
  ];

  static const _purchasedLiveEvents = <_EventListItem>[
    _EventListItem(
      image: AssetImages.eve2,
      title: 'Lorem ipsum dolor sit amet, consectetur.',
      date: 'May 15, 2026',
      price: r'$25.2',
    ),
    _EventListItem(
      image: AssetImages.u6,
      title: 'Lorem ipsum dolor sit amet, consectetur.',
      date: 'May 15, 2026',
      price: r'$25.2',
    ),
  ];

  static const _purchasedPastEvents = <_EventListItem>[
    _EventListItem(
      image: AssetImages.u5,
      title: 'Lorem ipsum dolor sit amet, consectetur.',
      date: 'May 15, 2026',
      price: r'$25.2',
    ),
  ];

  static const _createdUpcomingEvents = <_EventListItem>[
    _EventListItem(
      image: AssetImages.eve2,
      title: 'Lorem ipsum dolor sit amet, consectetur.',
      date: 'May 15, 2026',
      price: r'$25.2',
    ),
    _EventListItem(
      image: AssetImages.eve1,
      title: 'Lorem ipsum dolor sit amet, consectetur.',
      date: 'May 15, 2026',
      price: r'$25.2',
    ),
  ];

  static const _createdLiveEvents = <_EventListItem>[
    _EventListItem(
      image: AssetImages.live,
      title: 'Lorem ipsum dolor sit amet, consectetur.',
      date: 'May 15, 2026',
      price: r'$25.2',
    ),
  ];

  static const _createdPastEvents = <_EventListItem>[
    _EventListItem(
      image: AssetImages.u4,
      title: 'Lorem ipsum dolor sit amet, consectetur.',
      date: 'May 15, 2026',
      price: r'$25.2',
    ),
    _EventListItem(
      image: AssetImages.u3,
      title: 'Lorem ipsum dolor sit amet, consectetur.',
      date: 'May 15, 2026',
      price: r'$25.2',
    ),
  ];

  int get _subTabIndex =>
      _primaryTabIndex == 0 ? _purchasedSubTabIndex : _createdSubTabIndex;

  EventListCategory get _currentCategory {
    if (_primaryTabIndex == 0) {
      return switch (_purchasedSubTabIndex) {
        0 => EventListCategory.purchasedUpcoming,
        1 => EventListCategory.purchasedLive,
        _ => EventListCategory.purchasedPast,
      };
    }

    return switch (_createdSubTabIndex) {
      0 => EventListCategory.createdUpcoming,
      1 => EventListCategory.createdLive,
      _ => EventListCategory.createdPast,
    };
  }

  List<_EventListItem> get _currentEvents => switch (_currentCategory) {
        EventListCategory.purchasedUpcoming => _purchasedUpcomingEvents,
        EventListCategory.purchasedLive => _purchasedLiveEvents,
        EventListCategory.purchasedPast => _purchasedPastEvents,
        EventListCategory.createdUpcoming => _createdUpcomingEvents,
        EventListCategory.createdLive => _createdLiveEvents,
        EventListCategory.createdPast => _createdPastEvents,
      };

  void _onPrimaryTabChanged(int index) {
    setState(() => _primaryTabIndex = index);
  }

  void _onSubTabChanged(int index) {
    setState(() {
      if (_primaryTabIndex == 0) {
        _purchasedSubTabIndex = index;
      } else {
        _createdSubTabIndex = index;
      }
    });
  }

  void _onEventTap(_EventListItem event, EventListCategory category) {
    final data = event.toCheckoutData();

    switch (category) {
      case EventListCategory.purchasedUpcoming:
        Get.to(
          () => PurchasedEventDetailScreen(
            event: data,
            upcoming: true,
          ),
        );
      case EventListCategory.purchasedLive:
        Get.to(
          () => PurchasedEventDetailScreen(
            event: data,
            isLive: true,
          ),
        );
      case EventListCategory.purchasedPast:
        Get.to(
          () => PurchasedEventDetailScreen(
            event: data,
            past: true,
          ),
        );
      case EventListCategory.createdUpcoming:
        Get.to(
          () => CreatedEventDetailScreen(
            event: data,
            upcoming: true,
          ),
        );
      case EventListCategory.createdLive:
        Get.to(
          () => CreatedEventDetailScreen(
            event: data,
            isLive: true,
          ),
        );
      case EventListCategory.createdPast:
        Get.to(
          () => CreatedEventDetailScreen(
            event: data,
            past: true,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.verticalSpace,
        _PrimaryTabBar(
          tabs: _primaryTabs,
          selectedIndex: _primaryTabIndex,
          onChanged: _onPrimaryTabChanged,
        ),
        SizedBox(height: 14.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: _SubTabBar(
            tabs: _subTabs,
            selectedIndex: _subTabIndex,
            onChanged: _onSubTabChanged,
          ),
        ),
        SizedBox(height: 16.h),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 120.h),
            itemCount: _currentEvents.length,
            separatorBuilder: (_, __) => SizedBox(height: 12.h),
            itemBuilder: (context, index) {
              return _EventListTile(
                event: _currentEvents[index],
                category: _currentCategory,
                onTap: _onEventTap,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _PrimaryTabBar extends StatelessWidget {
  const _PrimaryTabBar({
    required this.tabs,
    required this.selectedIndex,
    required this.onChanged,
  });

  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final selected = selectedIndex == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(index),
              behavior: HitTestBehavior.opaque,
              child: Column(
                children: [
                  Text(
                    tabs[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppFonts.satoshi,
                      fontSize: 15.sp,
                      fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                      color: selected
                          ? AppColors.darkBlue
                          : AppColors.darkBlue.withValues(alpha: 0.6),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 3.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: selected
                          ? AppColors.darkBlue
                          : AppColors.darkBlue.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(99),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _SubTabBar extends StatelessWidget {
  const _SubTabBar({
    required this.tabs,
    required this.selectedIndex,
    required this.onChanged,
  });

  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(tabs.length, (index) {
        final selected = selectedIndex == index;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: index < tabs.length - 1 ? 10.w : 0),
            child: GestureDetector(
              onTap: () => onChanged(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 40.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selected
                      ? AppColors.darkBlue
                      : AppColors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(99999999.r),
                  border: Border.all(
                    color: selected
                        ? AppColors.darkBlue
                        : AppColors.darkBlue.withValues(alpha: 0.08),
                  ),
                ),
                child: Text(
                  tabs[index],
                  style: TextStyle(
                    fontFamily: AppFonts.satoshi,
                    fontSize: 14.sp,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                    color: AppColors.white.withValues(
                      alpha: selected ? 1 : 0.75,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _EventListTile extends StatelessWidget {
  const _EventListTile({
    required this.event,
    required this.category,
    required this.onTap,
  });

  final _EventListItem event;
  final EventListCategory category;
  final void Function(_EventListItem event, EventListCategory category) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(event, category),
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: const Color(0xFF09062B),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                event.image,
                width: 72.w,
                height: 72.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: AppFonts.satoshi,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.35,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Image.asset(
                        AssetIcons.eveB,
                        width: 16.w,
                        height: 16.h,
                        fit: BoxFit.cover,
                        color: AppColors.darkBlue,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        event.date,
                        style: TextStyle(
                          fontFamily: AppFonts.satoshi,
                          fontSize: 12.sp,
                          color: AppColors.white.withValues(alpha: 0.55),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              event.price,
              style: TextStyle(
                fontFamily: AppFonts.tactic,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EventListItem {
  const _EventListItem({
    required this.image,
    required this.title,
    required this.date,
    required this.price,
  });

  final String image;
  final String title;
  final String date;
  final String price;

  EventCheckoutData toCheckoutData() => EventCheckoutData(
        image: image,
        title: title,
        subtitle: 'Lorem ipsum dolor sit amet.',
        price: price,
        displayDate: date,
      );
}
