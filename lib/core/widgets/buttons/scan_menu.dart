import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_test/core/core.dart';
import 'package:pdf_test/ui_assets/assets.gen.dart';

/// Scan menu with button
class ScanMenu extends StatelessWidget {
  /// Init
  const ScanMenu({super.key, this.onMainTap});

  /// On main button tap
  final VoidCallback? onMainTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// Background capsule
          Container(
            height: 68.h,
            width: 264.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow.withValues(alpha: 0.1),
                  blurRadius: 6.r,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),

          /// Red circular button
          Positioned(
            top: 0,
            child: GestureDetector(
              onTap: onMainTap,
              child: Container(
                width: 82.r,
                height: 82.r,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.filler, width: 4.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow.withValues(alpha: 0.3),
                      blurRadius: 6.r,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Assets.images.scan.image(
                    width: 42.w,
                    height: 42.w,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
