import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:show_me_live/features/permissions/widgets/permission_view.dart';
import 'package:show_me_live/navbar.dart';

class AllowNotificationScreen extends StatelessWidget {
  const AllowNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PermissionView(
      icon: Icons.notifications,
      title: 'Allow Notification access',
      description:
          'Stay updated with event reminders, live alerts, and important updates so you never miss a moment.',
      buttonLabel: 'Allow Access',
      onAllow: () => Get.offAll(() => const Navbar()),
    );
  }
}
