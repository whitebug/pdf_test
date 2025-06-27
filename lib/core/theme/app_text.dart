import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_test/core/theme/app_colors.dart';
import 'package:pdf_test/core/theme/app_fonts.dart';

/// Text styles
class AppText {
  /// Heading style used for titles and prominent labels
  static final TextStyle heading = TextStyle(
    fontFamily: AppFonts.sfPro,
    fontSize: 21.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    color: AppColors.text,
  );

  /// Subheading style for inactive or disabled sections (e.g. placeholders)
  static final TextStyle subHeadingInactive = TextStyle(
    fontFamily: AppFonts.sfPro,
    fontSize: 17.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    color: AppColors.lowLight,
  );

  /// Standard subheading style for secondary labels and field descriptions
  static final TextStyle subHeading = TextStyle(
    fontFamily: AppFonts.sfPro,
    fontSize: 17.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    color: AppColors.text,
  );

  /// Accent heading
  static final TextStyle accentHeading = TextStyle(
    fontFamily: AppFonts.sfPro,
    fontSize: 17.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    color: AppColors.accent,
  );

  /// Main body text style for content and paragraphs
  static final TextStyle body = TextStyle(
    fontFamily: AppFonts.sfPro,
    fontSize: 19.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    color: AppColors.text,
  );

  /// Smaller body style for captions, helper text, or metadata
  static final TextStyle bodySmall = TextStyle(
    fontFamily: AppFonts.sfPro,
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    color: AppColors.lowText,
  );

  /// Sub heading light
  static final TextStyle subHeadingLight = TextStyle(
    fontFamily: AppFonts.sfPro,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    color: AppColors.lowLight,
  );

  /// Onboarding title
  static final TextStyle hugeTitle = TextStyle(
    fontFamily: AppFonts.sfPro,
    fontSize: 36.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: AppColors.text,
  );

  /// Onboarding subtitle
  static final TextStyle hugeSubtitle = TextStyle(
    fontFamily: AppFonts.sfPro,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: AppColors.text,
  );
}
