import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_test/core/core.dart';

/// Preview list
class PdfPagePreviewList extends StatelessWidget {
  /// Init
  const PdfPagePreviewList({
    required this.previewImages,
    required this.currentPage,
    this.onTap,
    super.key,
  });

  /// Images
  final List<ImageProvider> previewImages;

  /// Current page
  final int currentPage;

  /// On tap
  final void Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        scrollDirection: Axis.horizontal,
        itemCount: previewImages.length,
        separatorBuilder: (_, _) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          final isSelected = index == currentPage;
          return GestureDetector(
            onTap: () => onTap?.call(index),
            child: Container(
              width: 110.w,
              height: 160.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected ? AppColors.accent : Colors.transparent,
                  width: 2.w,
                ),
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadow.withValues(alpha: 0.1),
                    blurRadius: 4.r,
                    offset: Offset(0, 2.h),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.r),
                child: Image(
                  image: previewImages[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
