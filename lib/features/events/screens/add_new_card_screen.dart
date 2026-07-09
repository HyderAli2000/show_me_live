import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/assets_images.dart';
import 'package:show_me_live/core/widgets/app_text_field.dart';
import 'package:show_me_live/core/widgets/primary_button.dart';
import 'package:show_me_live/features/events/models/payment_method.dart';
import 'package:show_me_live/features/events/widgets/event_screen_app_bar.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  final _cardNumberController = TextEditingController();
  final _holderNameController = TextEditingController();
  final _expDateController = TextEditingController();
  final _cvvController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _holderNameController.dispose();
    _expDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _addCard() {
    final lastFour = _cardNumberController.text.trim();
    final masked = lastFour.length >= 4
        ? '**** **** **** ${lastFour.substring(lastFour.length - 4)}'
        : '**** **** **** 4563';

    Get.back(
      result: PaymentMethod(
        id: 'card_${DateTime.now().millisecondsSinceEpoch}',
        type: PaymentMethodType.custom,
        title: _holderNameController.text.trim().isEmpty
            ? 'New Card'
            : _holderNameController.text.trim(),
        subtitle: masked,
        brandColor: AppColors.primaryBlue,
        icon: Icons.credit_card_rounded,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: const EventScreenAppBar(title: 'Add New Card'),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetImages.allBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(18.w, 8.h, 18.w, 20.h),
                  child: Column(
                    children: [
                      AppTextField(
                        controller: _cardNumberController,
                        hintText: 'Card Number',
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 14.h),
                      AppTextField(
                        controller: _holderNameController,
                        hintText: 'Card Holder Name',
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: 14.h),
                      Row(
                        children: [
                          Expanded(
                            child: AppTextField(
                              controller: _expDateController,
                              hintText: 'Exp Date',
                              suffix: Icon(
                                Icons.calendar_today_rounded,
                                size: 18.sp,
                                color: AppColors.primaryBlue,
                              ),
                            ),
                          ),
                          SizedBox(width: 14.w),
                          Expanded(
                            child: AppTextField(
                              controller: _cvvController,
                              hintText: 'CVV',
                              keyboardType: TextInputType.number,
                              obscureText: true,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 30.h),
                child: SafeArea(
                  top: false,
                  child: PrimaryButton(
                    label: 'Add now',
                    onPressed: _addCard,
                    height: 52.h,
                    borderRadius: 30.r,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
