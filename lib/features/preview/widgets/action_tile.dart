import 'package:flutter/material.dart';
import 'package:pdf_test/core/core.dart';

/// Action tile
class ActionTile extends StatelessWidget {
  /// Init
  const ActionTile({
    required this.icon,
    required this.label,
    required this.onTap,
    super.key,
  });

  /// Icon widget
  final Widget icon;

  /// Label
  final String label;

  /// On tap
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
