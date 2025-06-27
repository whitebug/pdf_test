import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

/// Home screen utils
class HomeUtils {
  /// Get formatted data
  static String getFormattedData({required DateTime date}) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  /// Show dialog
  static void showHomeDialog({
    required BuildContext context,
    required Widget button,
    Widget? title,
    Widget? content,
  }) {
    showCupertinoDialog<void>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: title,
        content: content,
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: button,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
