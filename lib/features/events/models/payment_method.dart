import 'package:flutter/material.dart';

import 'package:show_me_live/core/theme/app_colors.dart';

enum PaymentMethodType {
  stripe,
  paypal,
  applePay,
  mastercard,
  reward,
  custom,
}

class PaymentMethod {
  PaymentMethod({
    required this.id,
    required this.type,
    required this.title,
    this.subtitle,
    this.brandColor,
    this.icon,
    this.isDeletable = true,
  });

  final String id;
  final PaymentMethodType type;
  final String title;
  final String? subtitle;
  final Color? brandColor;
  final IconData? icon;
  final bool isDeletable;

  static List<PaymentMethod> defaultMethods() => [
        PaymentMethod(
          id: 'stripe',
          type: PaymentMethodType.stripe,
          title: 'Stripe',
          brandColor: const Color(0xFF635BFF),
        ),
        PaymentMethod(
          id: 'paypal',
          type: PaymentMethodType.paypal,
          title: 'Paypal',
          brandColor: const Color(0xFF003087),
        ),
        PaymentMethod(
          id: 'apple_pay',
          type: PaymentMethodType.applePay,
          title: 'Apple Pay',
          subtitle: '**** **** **** 4563',
          brandColor: Colors.white,
        ),
        PaymentMethod(
          id: 'mastercard',
          type: PaymentMethodType.mastercard,
          title: 'Mastercard',
          subtitle: '**** **** **** 4563',
          brandColor: const Color(0xFFEB001B),
        ),
        PaymentMethod(
          id: 'reward',
          type: PaymentMethodType.reward,
          title: 'From Reward',
          icon: Icons.account_balance_wallet_outlined,
          brandColor: AppColors.primaryBlue,
          isDeletable: false,
        ),
      ];
}
