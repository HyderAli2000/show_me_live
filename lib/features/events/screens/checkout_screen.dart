import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_images.dart';
import 'package:show_me_live/core/widgets/app_success_screen.dart';
import 'package:show_me_live/core/widgets/primary_button.dart';
import 'package:show_me_live/features/events/models/event_checkout_data.dart';
import 'package:show_me_live/features/events/models/payment_method.dart';
import 'package:show_me_live/features/events/screens/add_new_card_screen.dart';
import 'package:show_me_live/features/events/widgets/event_screen_app_bar.dart';
import 'package:show_me_live/home_screen.dart';
import 'package:show_me_live/navbar.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, required this.event});

  final EventCheckoutData event;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late List<PaymentMethod> _paymentMethods;
  late String _selectedPaymentId;

  @override
  void initState() {
    super.initState();
    _paymentMethods = PaymentMethod.defaultMethods();
    _selectedPaymentId = _paymentMethods.first.id;
  }

  void _removePaymentMethod(PaymentMethod method) {
    setState(() {
      _paymentMethods.removeWhere((item) => item.id == method.id);
      if (_selectedPaymentId == method.id && _paymentMethods.isNotEmpty) {
        _selectedPaymentId = _paymentMethods.first.id;
      }
    });
  }

  Future<void> _openAddCard() async {
    final result = await Get.to<PaymentMethod>(() => const AddNewCardScreen());
    if (result == null) return;

    setState(() {
      _paymentMethods.insert(_paymentMethods.length - 1, result);
      _selectedPaymentId = result.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    final event = widget.event;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: const EventScreenAppBar(title: 'Check out'),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _EventPreviewCard(event: event),
                      SizedBox(height: 24.h),
                      _SectionHeading(title: 'Payment Method'),
                      SizedBox(height: 12.h),
                      ..._paymentMethods.map(
                        (method) => Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: _DismissiblePaymentTile(
                            method: method,
                            selected: _selectedPaymentId == method.id,
                            onTap: () =>
                                setState(() => _selectedPaymentId = method.id),
                            onDismissed: () => _removePaymentMethod(method),
                          ),
                        ),
                      ),
                      10.verticalSpace,
                      GestureDetector(
                        onTap: _openAddCard,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.add_rounded,
                                color: AppColors.darkBlue,
                                size: 15.sp,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'Add New Card',
                              style: TextStyle(
                                fontFamily: AppFonts.satoshi,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      10.verticalSpace,
                      _SectionHeading(title: 'Order Summary'),
                      SizedBox(height: 12.h),
                      _SummaryRow(
                        label: 'Ticket (x1)',
                        value: event.formattedTicketPrice,
                      ),
                      SizedBox(height: 10.h),
                      _SummaryRow(
                        label: 'Platform Fee',
                        value: event.formattedPlatformFee,
                      ),
                      SizedBox(height: 10.h),
                      _SummaryRow(
                        label: 'Total',
                        value: event.formattedTotal,
                        isTotal: true,
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
                    label: 'Pay Now',
                    onPressed: () {
                      Get.to(
                        () => AppSuccessScreen(
                          title: 'Payment Successful',
                          description:
                              'Your ticket has been purchased successfully. Check your email for confirmation.',
                          primaryActionLabel: 'Back to Home',
                          onPrimaryAction: () => Get.offAll(Navbar()),
                        ),
                      );
                    },
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

  // void _submitEvent() {
  //   final event = EventCheckoutData(
  //     image: AssetImages.eve1,
  //     title: _nameController.text.trim().isEmpty
  //         ? 'Lorem ipsum dolor sit amet.'
  //         : _nameController.text.trim(),
  //     subtitle: _categoryController.text.trim().isEmpty
  //         ? 'Gaming'
  //         : _categoryController.text.trim(),
  //     price: r'$25.2',
  //     displayDate: _dateController.text.trim().isEmpty
  //         ? 'May 15, 2026'
  //         : _dateController.text.trim(),
  //     fullDate: _dateController.text.trim().isEmpty
  //         ? 'Saturday, June 15, 2026'
  //         : _dateController.text.trim(),
  //     time: _timeController.text.trim().isEmpty
  //         ? '6:00 PM - 11:00 PM'
  //         : _timeController.text.trim(),
  //     description: _descriptionController.text.trim().isEmpty
  //         ? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
  //         : _descriptionController.text.trim(),
  //   );
}

class _EventPreviewCard extends StatelessWidget {
  const _EventPreviewCard({required this.event});

  final EventCheckoutData event;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
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
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: AppFonts.satoshi,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  event.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: AppFonts.satoshi,
                    fontSize: 12.sp,
                    color: AppColors.white.withValues(alpha: 0.55),
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Text(
                      event.price,
                      style: TextStyle(
                        fontFamily: AppFonts.tactic,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.calendar_today_rounded,
                      size: 14.sp,
                      color: AppColors.primaryBlue,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      event.displayDate,
                      style: TextStyle(
                        fontFamily: AppFonts.satoshi,
                        fontSize: 11.sp,
                        color: AppColors.white.withValues(alpha: 0.55),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: AppFonts.tactic,
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
    );
  }
}

class _DismissiblePaymentTile extends StatelessWidget {
  const _DismissiblePaymentTile({
    required this.method,
    required this.selected,
    required this.onTap,
    required this.onDismissed,
  });

  final PaymentMethod method;
  final bool selected;
  final VoidCallback onTap;
  final VoidCallback onDismissed;

  @override
  Widget build(BuildContext context) {
    final tile = _PaymentMethodTile(
      method: method,
      selected: selected,
      onTap: onTap,
    );

    if (!method.isDeletable) return tile;

    return Dismissible(
      key: ValueKey(method.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDismissed(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 22.w),
        decoration: BoxDecoration(
          color: const Color(0xFFE53935),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Icon(
          Icons.delete_outline_rounded,
          color: AppColors.white,
          size: 24.sp,
        ),
      ),
      child: tile,
    );
  }
}

class _PaymentMethodTile extends StatelessWidget {
  const _PaymentMethodTile({
    required this.method,
    required this.selected,
    required this.onTap,
  });

  final PaymentMethod method;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Color(0xff09062B),
          borderRadius: BorderRadius.circular(16.r),
          // border: Border.all(
          //   color: selected
          //       ? AppColors.primaryBlue.withValues(alpha: 0.55)
          //       : Colors.white.withValues(alpha: 0.08),
          // ),
        ),
        child: Row(
          children: [
            _PaymentBrandIcon(method: method),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    method.title,
                    style: TextStyle(
                      fontFamily: AppFonts.satoshi,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  if (method.subtitle != null) ...[
                    SizedBox(height: 2.h),
                    Text(
                      method.subtitle!,
                      style: TextStyle(
                        fontFamily: AppFonts.satoshi,
                        fontSize: 12.sp,
                        color: AppColors.white.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            _RadioIndicator(selected: selected),
          ],
        ),
      ),
    );
  }
}

class _PaymentBrandIcon extends StatelessWidget {
  const _PaymentBrandIcon({required this.method});

  final PaymentMethod method;

  @override
  Widget build(BuildContext context) {
    if (method.type == PaymentMethodType.mastercard) {
      return SizedBox(
        width: 34.w,
        height: 24.h,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              child: Container(
                width: 18.w,
                height: 18.w,
                decoration: const BoxDecoration(
                  color: Color(0xFFEB001B),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                width: 18.w,
                height: 18.w,
                decoration: const BoxDecoration(
                  color: Color(0xFFF79E1B),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      width: 34.w,
      height: 34.w,
      decoration: BoxDecoration(
        color:
            method.brandColor?.withValues(alpha: 0.18) ?? AppColors.inputFill,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(
        child: method.icon != null
            ? Icon(
                method.icon,
                size: 18.sp,
                color: method.brandColor ?? AppColors.white,
              )
            : Text(
                method.title.isNotEmpty ? method.title[0] : '?',
                style: TextStyle(
                  fontFamily: AppFonts.satoshi,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: method.brandColor ?? AppColors.white,
                ),
              ),
      ),
    );
  }
}

class _RadioIndicator extends StatelessWidget {
  const _RadioIndicator({required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22.w,
      height: 22.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected
              ? AppColors.primaryBlue
              : AppColors.white.withValues(alpha: 0.35),
          width: 2,
        ),
      ),
      child: selected
          ? Center(
              child: Container(
                width: 10.w,
                height: 10.w,
                decoration: const BoxDecoration(
                  color: AppColors.primaryBlue,
                  shape: BoxShape.circle,
                ),
              ),
            )
          : null,
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  final String label;
  final String value;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: AppFonts.satoshi,
            fontSize: isTotal ? 16.sp : 14.sp,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
            color: AppColors.white.withValues(alpha: isTotal ? 1 : 0.75),
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontFamily: AppFonts.satoshi,
            fontSize: isTotal ? 16.sp : 14.sp,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
