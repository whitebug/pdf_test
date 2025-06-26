import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_test/core/theme/theme.dart';

/// Rounded text field
class RoundedTextField extends StatelessWidget {
  /// Init
  const RoundedTextField({
    super.key,
    this.controller,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onChanged,
    this.onTapOutside,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
    this.labelTextStr = '',
    this.hintTextStr = '',
    this.height,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.isCapitalization = false,
    this.textStyle,
    this.isDense = true,
  });

  /// Controller for managing the text input
  final TextEditingController? controller;

  /// Called when editing is completed (e.g. on "done" or losing focus)
  final void Function()? onEditingComplete;

  /// Called when the user submits the field (e.g. presses "submit" on the keyboard)
  final void Function(String)? onFieldSubmitted;

  /// Called every time the text changes
  final void Function(String)? onChanged;

  /// Called when the user taps outside of the text field
  final void Function(PointerDownEvent)? onTapOutside;

  /// The type of keyboard to use for the input field (e.g. text, number, email)
  final TextInputType? keyboardType;

  /// A function to validate the input value; returns an error message or null
  final String? Function(String?)? validator;

  /// A list of input formatters to apply to the text field (e.g. digits only)
  final List<TextInputFormatter>? inputFormatters;

  /// The label text displayed above or inside the text field
  final String labelTextStr;

  /// The hint text displayed inside the text field when it's empty
  final String hintTextStr;

  /// The height of the text field
  final double? height;

  /// A focus node to control and observe focus state
  final FocusNode? focusNode;

  /// Widget displayed as a prefix icon (on the left side of the field)
  final Widget? prefixIcon;

  /// Widget displayed as a suffix icon (on the right side of the field)
  final Widget? suffixIcon;

  /// Enables sentence-style text capitalization
  final bool isCapitalization;

  /// Custom text style for the input text
  final TextStyle? textStyle;

  /// Reduces internal vertical padding of the field
  final bool isDense;

  @override
  Widget build(BuildContext context) {
    final effectiveHeight = height ?? 52.h;
    final effectiveStyle = textStyle ?? AppText.subHeading;
    final verticalPadding = (effectiveHeight - effectiveStyle.fontSize!) / 2.3;

    return SizedBox(
      height: effectiveHeight,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        validator: validator,
        onEditingComplete: onEditingComplete,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        onTapOutside: onTapOutside,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        textCapitalization: isCapitalization
            ? TextCapitalization.sentences
            : TextCapitalization.none,
        style: effectiveStyle,
        decoration: InputDecoration(
          isDense: isDense,
          labelText: labelTextStr,
          hintText: hintTextStr,
          labelStyle: AppText.heading,
          hintStyle: AppText.subHeadingInactive,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          fillColor: AppColors.filler,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: verticalPadding,
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 32,
            minHeight: 32,
          ),
          suffixIconConstraints: const BoxConstraints(
            minWidth: 32,
            minHeight: 32,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sp),
            borderSide: const BorderSide(color: AppColors.filler),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sp),
            borderSide: const BorderSide(color: AppColors.filler),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sp),
            borderSide: const BorderSide(color: AppColors.filler),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sp),
            borderSide: BorderSide(color: AppColors.fillerStrong),
          ),
        ),
      ),
    );
  }
}
