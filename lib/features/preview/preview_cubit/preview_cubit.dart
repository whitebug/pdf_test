import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image/image.dart' as img_data;
import 'package:injectable/injectable.dart';
import 'package:pdf_render/pdf_render.dart';
import 'package:pdf_test/core/router.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart' as sfp;

part 'preview_cubit.freezed.dart';
part 'preview_state.dart';

/// Preview logic
@injectable
class PreviewCubit extends Cubit<PreviewState> {
  /// Init
  PreviewCubit() : super(const PreviewState.state());

  ui.Size _getImageSizeSync(Uint8List bytes) {
    final decoded = img_data.decodeImage(bytes)!;
    return ui.Size(decoded.width.toDouble(), decoded.height.toDouble());
  }

  /// Replace edited pages
  Future<void> _replacePage({
    required String originalPath,
    required Uint8List pageImage,
    required int pageIndex,
  }) async {
    final bytes = await File(originalPath).readAsBytes();
    final doc = sfp.PdfDocument(inputBytes: bytes);
    doc.pages.removeAt(pageIndex);
    final size = _getImageSizeSync(pageImage);
    final newPage = doc.pages.insert(
      pageIndex,
      ui.Size(
        size.width,
        size.height,
      ),
    );
    newPage.graphics.drawImage(
      sfp.PdfBitmap(pageImage),
      ui.Rect.fromLTWH(0, 0, size.width, size.height),
    );
    await File(originalPath).writeAsBytes(await doc.save());
    doc.dispose();
  }

  /// Open as image
  Future<void> renderPageAsImage(String pdfPath, int pageIndex) async {
    final doc = await PdfDocument.openFile(pdfPath);
    final page = await doc.getPage(pageIndex + 1);
    final img = await page.render(
      width: (page.width * 2).toInt(),
      height: (page.height * 2).toInt(),
    );

    final uiImage = await img.createImageIfNotAvailable();
    final byteData = await uiImage.toByteData(format: ui.ImageByteFormat.png);
    final result = byteData!.buffer.asUint8List();
    await doc.dispose();
    emit(state.copyWith(imageBytes: result));
    final pageImage = await router.push('/pdf_edit', extra: result);

    if (pageImage == null) {
      return;
    }
    await _replacePage(
      originalPath: pdfPath,
      pageImage: pageImage as Uint8List,
      pageIndex: pageIndex,
    );
    router.go('/home_page/pdf_preview', extra: pdfPath);
  }
}
