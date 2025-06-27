import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_test/core/core.dart';

/// Dot for page indicator
class OnboardingDot extends StatelessWidget {
  /// Init
  const OnboardingDot({
    required this.isActive,
    super.key,
  });

  /// If dot is active
  final bool isActive;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
    width: 6.w,
    height: isActive ? 28.h : 12.h,
    duration: const Duration(milliseconds: 300),
    decoration: BoxDecoration(
      color: isActive ? AppColors.accent : AppColors.greyDot,
      borderRadius: BorderRadius.circular(88),
    ),
  );
}
