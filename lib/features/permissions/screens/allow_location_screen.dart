import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:show_me_live/features/permissions/screens/allow_notification_screen.dart';
import 'package:show_me_live/features/permissions/widgets/permission_view.dart';

class AllowLocationScreen extends StatelessWidget {
  const AllowLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PermissionView(
      icon: Icons.location_on,
      title: 'Allow Location Access',
      description:
          'Enable location access to discover events near you and get a more personalized experience.',
      buttonLabel: 'Allow Access',
      onAllow: () => Get.to(() => const AllowNotificationScreen()),
    );
  }
}
