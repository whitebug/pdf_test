import 'package:objectbox/objectbox.dart';

/// Pdf file
@Entity()
class PdfFileEntity {
  /// Init
  PdfFileEntity({
    required this.fileName,
    required this.filePath,
    required this.dateTime,
    required this.pageNumber,
    this.id = 0,
  });

  /// Id
  @Id()
  int id;

  /// File name
  String fileName;

  /// File path
  String filePath;

  /// Date
  DateTime dateTime;

  /// Page number
  int pageNumber;
}
