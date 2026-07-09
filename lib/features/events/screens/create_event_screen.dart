import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_images.dart';
import 'package:show_me_live/core/widgets/app_success_screen.dart';
import 'package:show_me_live/core/widgets/app_text_field.dart';
import 'package:show_me_live/core/widgets/primary_button.dart';
import 'package:show_me_live/features/events/models/event_checkout_data.dart';
import 'package:show_me_live/features/events/screens/event_details_screen.dart';
import 'package:show_me_live/features/events/widgets/event_screen_app_bar.dart';
import 'package:show_me_live/navbar.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final _categoryController = TextEditingController();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _ticketPriceController = TextEditingController();
  final _maxMembersController = TextEditingController();
  String? _selectedEventType;

  @override
  void dispose() {
    _categoryController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _ticketPriceController.dispose();
    _maxMembersController.dispose();
    super.dispose();
  }

  void _submitEvent() {
    final event = EventCheckoutData(
      image: AssetImages.eve1,
      title: _nameController.text.trim().isEmpty
          ? 'Lorem ipsum dolor sit amet.'
          : _nameController.text.trim(),
      subtitle: _categoryController.text.trim().isEmpty
          ? 'Gaming'
          : _categoryController.text.trim(),
      price: r'$25.2',
      displayDate: _dateController.text.trim().isEmpty
          ? 'May 15, 2026'
          : _dateController.text.trim(),
      fullDate: _dateController.text.trim().isEmpty
          ? 'Saturday, June 15, 2026'
          : _dateController.text.trim(),
      time: _timeController.text.trim().isEmpty
          ? '6:00 PM - 11:00 PM'
          : _timeController.text.trim(),
      description: _descriptionController.text.trim().isEmpty
          ? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
          : _descriptionController.text.trim(),
    );

    Get.off(
      () => AppSuccessScreen(
        title: 'Event Created',
        description:
            'Your event has been created successfully. Share the link and get ready to go live.',
        linkText: 'liveevent/showmelivecreatores',
        secondaryActionLabel: 'Back to Home',
        onSecondaryAction: () => Get.offAll(() => const Navbar()),
        primaryActionLabel: 'View Event',
        onPrimaryAction: () => Get.off(() => EventDetailsScreen(event: event)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: const EventScreenAppBar(title: 'Create Event'),
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
                      const _UploadImageBox(),
                      SizedBox(height: 14.h),
                      AppTextField(
                        controller: _categoryController,
                        hintText: 'Event Category',
                      ),
                      SizedBox(height: 14.h),
                      AppTextField(
                        controller: _nameController,
                        hintText: 'Event Name',
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: 14.h),
                      _MultilineField(
                        controller: _descriptionController,
                        hintText: 'Event Description',
                      ),
                      SizedBox(height: 14.h),
                      AppTextField(
                        controller: _dateController,
                        hintText: 'Event Date',
                        suffix: Icon(
                          Icons.calendar_today_rounded,
                          color: AppColors.primaryBlue,
                          size: 18.sp,
                        ),
                      ),
                      SizedBox(height: 14.h),
                      AppTextField(
                        controller: _timeController,
                        hintText: 'Event Time',
                        suffix: Icon(
                          Icons.access_time_rounded,
                          color: AppColors.primaryBlue,
                          size: 18.sp,
                        ),
                      ),
                      SizedBox(height: 14.h),
                      AppTextField(
                        keyboardType: TextInputType.number,
                        controller: _ticketPriceController,
                        hintText: 'Ticket Price',
                      ),
                      SizedBox(height: 14.h),
                      AppTextField(
                        keyboardType: TextInputType.number,
                        controller: _maxMembersController,
                        hintText: 'Maximum Members',
                      ),
                      SizedBox(height: 14.h),
                      _EventTypeDropdown(
                        selectedValue: _selectedEventType,
                        onChanged: (value) {
                          setState(() => _selectedEventType = value);
                        },
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
                    onPressed: _submitEvent,
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

class _EventTypeDropdown extends StatefulWidget {
  const _EventTypeDropdown({
    required this.selectedValue,
    required this.onChanged,
  });

  final String? selectedValue;
  final ValueChanged<String> onChanged;

  static const _options = <({String title, String subtitle})>[
    (title: 'Standard Setup', subtitle: 'Single Camera'),
    (title: 'Pro Setup', subtitle: 'Multiple Camera'),
  ];

  @override
  State<_EventTypeDropdown> createState() => _EventTypeDropdownState();
}

class _EventTypeDropdownState extends State<_EventTypeDropdown> {
  bool _expanded = false;

  String _labelFor(String value) {
    for (final option in _EventTypeDropdown._options) {
      final full = '${option.title} (${option.subtitle})';
      if (full == value) return full;
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = AppColors.white.withValues(alpha: 0.55);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkBlue.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30.r),
              bottom: Radius.circular(_expanded ? 0 : 30.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.selectedValue == null
                          ? 'Event Type'
                          : _labelFor(widget.selectedValue!),
                      style: TextStyle(
                        fontFamily: AppFonts.satoshi,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: widget.selectedValue == null
                            ? AppColors.hintText
                            : AppColors.textDim,
                      ),
                    ),
                  ),
                  Icon(
                    _expanded
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    color: AppColors.white.withValues(alpha: 0.75),
                    size: 22.sp,
                  ),
                ],
              ),
            ),
          ),
          if (_expanded) ...[
            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.white.withValues(alpha: 0.12),
            ),
            ..._EventTypeDropdown._options.map((option) {
              final value = '${option.title} (${option.subtitle})';
              final isLast = option == _EventTypeDropdown._options.last;

              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      widget.onChanged(value);
                      setState(() => _expanded = false);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 18.w,
                        vertical: 16.h,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontFamily: AppFonts.satoshi,
                              fontSize: 14.sp,
                              height: 1.35,
                            ),
                            children: [
                              TextSpan(
                                text: '${option.title} ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white.withValues(alpha: 0.9),
                                ),
                              ),
                              TextSpan(
                                text: '(${option.subtitle})',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white.withValues(
                                    alpha: 0.45,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (!isLast)
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.white.withValues(alpha: 0.12),
                    ),
                ],
              );
            }),
          ],
        ],
      ),
    );
  }
}

class _UploadImageBox extends StatelessWidget {
  const _UploadImageBox();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 150.h,
        decoration: BoxDecoration(
          color: AppColors.inputFill.withValues(alpha: 0.45),
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: CustomPaint(
          painter: _DashedBorderPainter(
            color: AppColors.white.withValues(alpha: 0.35),
            radius: 18.r,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cloud_upload_outlined,
                size: 34.sp,
                color: AppColors.white.withValues(alpha: 0.8),
              ),
              SizedBox(height: 10.h),
              Text(
                'Upload Image',
                style: TextStyle(
                  fontFamily: AppFonts.satoshi,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white.withValues(alpha: 0.75),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MultilineField extends StatelessWidget {
  const _MultilineField({required this.controller, required this.hintText});

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 5,
      minLines: 5,
      style: TextStyle(
        fontFamily: AppFonts.satoshi,
        color: AppColors.textDim,
        fontSize: 14.sp,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: AppFonts.satoshi,
          color: AppColors.hintText,
          fontSize: 14.sp,
        ),
        filled: true,
        fillColor: AppColors.darkBlue.withValues(alpha: 0.2),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: AppColors.white.withValues(alpha: 0.55),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: AppColors.white.withValues(alpha: 0.55),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: AppColors.white.withValues(alpha: 0.55),
          ),
        ),
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  _DashedBorderPainter({required this.color, required this.radius});

  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(1, 1, size.width - 2, size.height - 2),
      Radius.circular(radius),
    );

    const dashWidth = 6.0;
    const dashSpace = 4.0;
    final path = Path()..addRRect(rect);
    final metrics = path.computeMetrics();

    for (final metric in metrics) {
      double distance = 0;
      while (distance < metric.length) {
        final next = distance + dashWidth;
        canvas.drawPath(
          metric.extractPath(distance, next.clamp(0, metric.length)),
          paint,
        );
        distance = next + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
