import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_me_live/core/theme/app_colors.dart';
import 'package:show_me_live/core/theme/app_fonts.dart';

/// Generic, app-wide text field with the project's rounded pill styling.
///
/// Supports an optional asset/widget prefix icon, an optional custom suffix,
/// and a built-in password visibility toggle via [enablePasswordToggle].
class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.prefixIconAsset,
    this.prefixIcon,
    this.suffix,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.enablePasswordToggle = false,
    this.onChanged,
    this.onSubmitted,
    this.fillColor,
    this.borderColor,
    this.textColor,
    this.hintColor,
    this.borderRadius,
    this.contentPadding,
    this.focusNode,
  });

  final String hintText;
  final TextEditingController? controller;

  /// Path to an image asset used as the leading icon.
  final String? prefixIconAsset;

  /// Custom leading widget. Takes precedence over [prefixIconAsset].
  final Widget? prefixIcon;

  /// Custom trailing widget. Ignored when [enablePasswordToggle] is true.
  final Widget? suffix;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  /// Obscures text without showing a toggle. Use [enablePasswordToggle] for a
  /// field with a built-in show/hide eye button.
  final bool obscureText;
  final bool enablePasswordToggle;

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  final Color? fillColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? hintColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText || widget.enablePasswordToggle;
  }

  @override
  Widget build(BuildContext context) {
    final radius = widget.borderRadius ?? 30.r;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(
        color: widget.borderColor ?? AppColors.white.withValues(alpha: 0.55),
      ),
    );

    Widget? prefix = widget.prefixIcon;
    if (prefix == null && widget.prefixIconAsset != null) {
      prefix = Padding(
        padding: EdgeInsets.all(14.w),
        child: Image.asset(widget.prefixIconAsset!, width: 14.w, height: 14.h),
      );
    }

    Widget? suffix = widget.suffix;
    if (widget.enablePasswordToggle) {
      // Circular eye toggle to match the auth screenshots.
      suffix = InkWell(
        onTap: () => setState(() => _obscure = !_obscure),
        borderRadius: BorderRadius.circular(18.r),
        child: Icon(
          _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          size: 18.w,
          color: AppColors.white.withValues(alpha: 0.85),
        ),
      );
    }

    return TextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      obscureText: widget.enablePasswordToggle ? _obscure : widget.obscureText,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      style: TextStyle(
        fontFamily: AppFonts.arial,
        color: widget.textColor ?? AppColors.textDim,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontFamily: AppFonts.arial,
          color: widget.hintColor ?? AppColors.hintText,
          fontSize: 14.sp,
        ),
        filled: true,
        fillColor:
            widget.fillColor ?? AppColors.darkBlue.withValues(alpha: 0.2),
        contentPadding:
            widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        prefixIcon: prefix,
        suffixIcon: suffix,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }
}
