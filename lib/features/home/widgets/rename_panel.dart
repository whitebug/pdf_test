import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pdf_test/core/core.dart';

/// Rename
class RenamePanel extends StatelessWidget {
  /// Init
  const RenamePanel({
    required this.controller,
    required this.onSave,
    super.key,
  });

  /// Text controller
  final TextEditingController controller;

  /// On save
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
        decoration: BoxDecoration(
          color: AppColors.filler,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              blurRadius: 12,
              color: AppColors.shadow.withValues(alpha: 0.15),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.close, color: AppColors.text),
                  splashRadius: 20,
                  onPressed: () => context.pop(),
                ),
                const SizedBox(width: 4),
                Text('rename', style: AppText.body).tr(),
              ],
            ),
            const SizedSBox(height: 24),
            TextField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(
                hint: Text('previewName', style: AppText.subHeading).tr(),
                contentPadding: EdgeInsetsS.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.accent),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedSBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  elevation: 8,
                  shadowColor: Colors.red.withValues(alpha: 0.4),
                ),
                onPressed: onSave,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'save',
                      style: AppText.subHeadingInactive.copyWith(
                        color: AppColors.filler,
                      ),
                    ).tr(),
                    const SizedSBox(width: 8),
                    Icon(Icons.check, size: 24.sp, color: AppColors.filler),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
