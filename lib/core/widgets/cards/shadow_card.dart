import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_test/core/core.dart';

/// Card with shadow
class ShadowCard extends StatelessWidget {
  /// Init
  const ShadowCard({
    this.child,
    super.key,
  });

  /// Child
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.filler,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withValues(alpha: 0.1),
            blurRadius: 3.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
