import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';
import 'package:show_me_live/core/theme/assets_icons.dart';
import 'package:show_me_live/core/theme/assets_images.dart';

class ChatSupportScreen extends StatelessWidget {
  const ChatSupportScreen({super.key});

  static const _sample =
      'Lorem ipsum dolor  amet, consectetur adipising elit, eiusmod tempor...';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leadingWidth: 70.w,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        toolbarHeight: 64.h,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 18.w,
                    color: AppColors.darkBlue,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Container(
                width: 40.w,
                height: 40.w,
                padding: EdgeInsets.all(10.w),
                decoration: const BoxDecoration(
                  color: AppColors.buttonBlue,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  AssetIcons.supp,
                  fit: BoxFit.contain,
                  color: AppColors.white,
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Chat',
                    style: TextStyle(
                      fontFamily: AppFonts.arial,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.1,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    'Support',
                    style: TextStyle(
                      fontFamily: AppFonts.arial,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.1,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetImages.allBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              10.verticalSpace,
              Expanded(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(18.w, 16.h, 18.w, 16.h),
                  children: const [
                    _ChatBubble(message: _sample, time: '3:00 pm', isMe: false),
                    _ChatBubble(message: _sample, time: '3:00 pm', isMe: true),
                    _ChatBubble(message: _sample, time: '3:00 pm', isMe: false),
                    _ChatBubble(message: _sample, time: '3:00 pm', isMe: true),
                    _ChatBubble(message: _sample, time: '3:00 pm', isMe: false),
                    _ChatBubble(message: _sample, time: '3:00 pm', isMe: true),
                  ],
                ),
              ),
              Divider(color: Colors.white),
              const _MessageInput(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  const _ChatBubble({
    required this.message,
    required this.time,
    required this.isMe,
  });

  final String message;
  final String time;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    final avatar = Container(
      width: 40.w,
      height: 40.w,
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.all(isMe ? 0 : 5.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isMe ? Colors.transparent : AppColors.white,
      ),
      child: isMe
          ? Image.asset(AssetImages.u1, fit: BoxFit.cover)
          : Image.asset(
              AssetIcons.supp,
              fit: BoxFit.contain,
              color: Color(0xff363738),
            ),
    );

    final bubble = Flexible(
      child: Column(
        crossAxisAlignment: isMe
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: isMe ? AppColors.buttonBlue : const Color(0xFF09062B),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
                bottomLeft: Radius.circular(isMe ? 16.r : 2.r),
                bottomRight: Radius.circular(isMe ? 2.r : 16.r),
              ),
              border: isMe
                  ? null
                  : Border.all(color: Colors.white.withValues(alpha: 0.08)),
            ),
            child: Text(
              message,
              style: TextStyle(
                fontFamily: AppFonts.arial,
                fontSize: 13.sp,
                height: 1.4,
                color: AppColors.white.withValues(alpha: 0.85),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            time,
            style: TextStyle(
              fontFamily: AppFonts.arial,
              fontSize: 11.sp,
              color: AppColors.white.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );

    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: isMe
            ? [bubble, SizedBox(width: 10.w), avatar]
            : [avatar, SizedBox(width: 10.w), bubble],
      ),
    );
  }
}

class _MessageInput extends StatelessWidget {
  const _MessageInput();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.w, 20.h, 18.w, 30.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              cursorColor: AppColors.white,
              style: TextStyle(
                fontFamily: AppFonts.arial,
                fontSize: 14.sp,
                color: Color(0xffFFFFFF).withValues(alpha: 0.2),
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFFFFFFF).withValues(alpha: 0.08),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 18.w,
                  vertical: 12.h,
                ),
                hintText: 'Write your message...',
                hintStyle: TextStyle(
                  fontFamily: AppFonts.arial,
                  fontSize: 14.sp,
                  color: AppColors.white.withValues(alpha: 0.5),
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9999999.r),
                  borderSide: BorderSide(
                    color: Colors.white.withValues(alpha: 0.12),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9999999.r),
                  borderSide: BorderSide(
                    color: Colors.white.withValues(alpha: 0.12),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9999999.r),
                  borderSide: BorderSide(
                    color: AppColors.primaryBlue.withValues(alpha: 0.35),
                  ),
                ),
              ),
              textAlignVertical: TextAlignVertical.center,
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            width: 50.w,
            height: 50.w,
            padding: EdgeInsets.all(10.w),
            decoration: const BoxDecoration(
              color: AppColors.buttonBlue,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              AssetIcons.send,
              fit: BoxFit.contain,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
