import 'package:flutter/material.dart';
import 'package:pdf_test/core/core.dart';

/// Irremovable dialog page alert
class IrremovableDialog extends Page<void> {
  /// A page to display a dialog.
  const IrremovableDialog({required this.child, super.key});

  /// The widget to be displayed which is usually a [Dialog] widget.
  final Widget child;

  @override
  Route<void> createRoute(BuildContext context) {
    return DialogRoute<void>(
      context: context,
      settings: this,
      useSafeArea: false,
      barrierDismissible: false,
      barrierColor: AppColors.shadow.withValues(alpha: 0.6),
      builder: (BuildContext context) => child,
    );
  }
}
