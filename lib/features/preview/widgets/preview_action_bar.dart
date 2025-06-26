import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_test/core/core.dart';
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
            _ActionTile(
              icon: Assets.images.pen.image(width: 30.w, height: 30.w),
              label: 'Edit',
              onTap: onEdit,
            ),
            _ActionTile(
              icon: Assets.images.add.image(width: 30.w, height: 30.w),
              label: 'Add',
              onTap: onAdd,
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final Widget icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsetsS.symmetric(horizontal: 34),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: 6),
            Text(
              label,
              style: AppText.bodySmall.copyWith(color: AppColors.text),
            ),
          ],
        ),
      ),
    );
  }
}
