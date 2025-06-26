import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Utils
class PreviewUtils {
  /// Get absolute path
  static Future<String> absolutePath(String fileName) async => p.join(
    (await getApplicationDocumentsDirectory()).path,
    'scans',
    fileName,
  );
}
