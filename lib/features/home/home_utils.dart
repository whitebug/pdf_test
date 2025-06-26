import 'package:intl/intl.dart';

/// Home screen utils
class HomeUtils {
  /// Get formatted data
  static String getFormattedData({required DateTime date}) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
