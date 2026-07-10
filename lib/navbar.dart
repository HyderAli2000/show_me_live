import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:show_me_live/core/theme/assets_icons.dart';
import 'package:show_me_live/core/theme/assets_images.dart';
import 'package:show_me_live/core/widgets/navbar/app_bottom_nav_bar.dart';
import 'package:show_me_live/core/widgets/navbar/app_home_app_bar.dart';
import 'package:show_me_live/features/events/screens/create_event_screen.dart';
import 'package:show_me_live/features/home/screens/discover_screen.dart';
import 'package:show_me_live/features/home/screens/events_screen.dart';
import 'package:show_me_live/features/home/screens/notifications_screen.dart';
import 'package:show_me_live/features/home/screens/profile_screen.dart';
import 'package:show_me_live/features/home/screens/wallet_screen.dart';
import 'package:show_me_live/home_screen.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  void initState() {
    super.initState();
    Get.put(BottomNavController());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
      init: Get.find<BottomNavController>(),
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetImages.allBg),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            appBar: AppHomeAppBar(
              showSearchRow: controller.currentIndex <= 1,
              onNotificationTap: () =>
                  Get.to(() => const NotificationsScreen()),
              // onAddTap: () => Get.to(() => const CreateEventScreen()),
              onAddTap: () {},
              onSearchTap: () {},
            ),
            body: SafeArea(
              bottom: true,
              child: controller.pages[controller.currentIndex],
            ),
            bottomNavigationBar: AppBottomNavBar(
              currentIndex: controller.currentIndex,
              items: controller.navItems,
              onTap: controller.itemSelect,
              showFab: controller.currentIndex <= 3,
              onFabTap: () => Get.to(() => const CreateEventScreen()),
            ),
          ),
        );
      },
    );
  }
}

class BottomNavController extends GetxController {
  int currentIndex = 0;

  late final List<Widget> pages;

  List<AppBottomNavItem> get navItems => const [
    AppBottomNavItem(label: 'Home', iconAsset: AssetIcons.homeB),
    AppBottomNavItem(label: 'Discover', iconAsset: AssetIcons.discB),
    AppBottomNavItem(label: 'Events', iconAsset: AssetIcons.eveB),
    AppBottomNavItem(label: 'Wallet', iconAsset: AssetIcons.wallB),
    AppBottomNavItem(label: 'Profile', iconAsset: AssetIcons.profB),
  ];

  @override
  void onInit() {
    super.onInit();
    pages = const [
      HomeScreen(),
      DiscoverScreen(),
      EventsScreen(),
      WalletScreen(),
      ProfileScreen(),
    ];
  }

  void itemSelect(int index) {
    currentIndex = index;
    update();
  }
}
