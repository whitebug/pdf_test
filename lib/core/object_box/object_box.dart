import 'package:pdf_test/core/core.dart';
import 'package:pdf_test/objectbox.g.dart';

/// DB
late final ObjectBox objectBox;

/// DB
class ObjectBox {
  ObjectBox._create(this.store) {
    pdfBox = Box<PdfFileEntity>(store);
  }

  /// Store
  late final Store store;

  /// PDF box
  late final Box<PdfFileEntity> pdfBox;

  /// Create
  static Future<ObjectBox> create() async {
    final store = await openStore();
    return ObjectBox._create(store);
  }
}
