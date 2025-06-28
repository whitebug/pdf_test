import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_test/core/core.dart';
import 'package:pdf_test/features/preview/preview.dart';
import 'package:pdf_test/ui_assets/assets.gen.dart';

/// Action bar
class PreviewActionBar extends StatelessWidget {
  /// Init
  const PreviewActionBar({
    required this.onEdit,
    required this.onAdd,
    super.key,
  });

  /// On edit
  final VoidCallback onEdit;

  /// On add
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.filler,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 12,
              color: AppColors.shadow.withValues(alpha: 0.1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ActionTile(
              icon: Assets.images.pen.image(width: 30.w, height: 30.w),
              label: 'edit'.tr(),
              onTap: onEdit,
            ),
            ActionTile(
              icon: Assets.images.add.image(width: 30.w, height: 30.w),
              label: 'add'.tr(),
              onTap: onAdd,
            ),
          ],
        ),
      ),
    );
  }
}
