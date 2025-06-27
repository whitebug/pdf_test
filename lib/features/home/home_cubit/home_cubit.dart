import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doc_scanner/flutter_doc_scanner.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:pdf_test/core/core.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

/// How much pages to scan
const int pagesToScan = 5;

/// Home logic
@injectable
class HomeCubit extends Cubit<HomeState> {
  /// Init
  HomeCubit() : super(const HomeState.state());

  /// Get all pdf documents saved previously
  void getPdfDocuments() {
    emit(state.copyWith(isLoading: true));
    try {
      final pdfs = objectBox.pdfBox.getAll()
        ..sort((a, b) => b.dateTime.compareTo(a.dateTime));
      emit(
        state.copyWith(
          pdfList: pdfs,
          pdfFilteredList: pdfs,
          error: null,
          isLoading: false,
        ),
      );
    } on Exception catch (_) {
      emit(
        state.copyWith(
          isLoading: false,
          error: 'filesFetchError'.tr(),
        ),
      );
    }
  }

  /// Scan
  Future<void> scanDocument() async {
    emit(state.copyWith(isLoading: true));
    try {
      final tempPath =
          await FlutterDocScanner().getScannedDocumentAsPdf(page: pagesToScan)
              as String?;
      if (tempPath == null) {
        emit(
          state.copyWith(
            error: 'unknownPlatformDocuments'.tr(),
            isLoading: false,
          ),
        );
        return;
      }
      final fileName = p.basename(tempPath);
      final docsDir = await getApplicationDocumentsDirectory();
      final permDir = Directory(p.join(docsDir.path, 'scans'));
      await permDir.create(recursive: true);
      final permPath = p.join(permDir.path, fileName);
      final savedFile = await File(tempPath).rename(permPath);
      objectBox.pdfBox.put(
        PdfFileEntity(
          fileName: fileName,
          filePath: savedFile.path,
          dateTime: DateTime.now(),
        ),
      );
      getPdfDocuments();
    } on PlatformException {
      emit(
        state.copyWith(
          error: 'failedToGetScannedDocuments'.tr(),
          isLoading: false,
        ),
      );
    }
  }

  /// Change sorting
  void changeSort() {
    final pdfs = state.pdfFilteredList.toList();
    if (state.isDesc) {
      pdfs.sort((a, b) => b.dateTime.compareTo(a.dateTime));
    } else {
      pdfs.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    }
    emit(
      state.copyWith(
        isDesc: !state.isDesc,
        pdfFilteredList: pdfs,
      ),
    );
  }

  /// Search through items
  void searchItems({String? query}) {
    if (query == null || query.isEmpty) {
      emit(state.copyWith(pdfFilteredList: state.pdfList));
      return;
    }
    final filtered = state.pdfFilteredList.where((pdf) {
      return pdf.fileName.toLowerCase().contains(query);
    }).toList();
    emit(state.copyWith(pdfFilteredList: filtered));
  }

  /// Delete document
  Future<void> deleteDocument(PdfFileEntity doc) async {
    emit(state.copyWith(isLoading: true));
    try {
      final file = File(doc.filePath);
      if (file.existsSync()) {
        await file.delete();
      }
      objectBox.pdfBox.remove(doc.id);
      getPdfDocuments();
    } on FileSystemException catch (e) {
      emit(
        state.copyWith(
          error: 'fileSystemError'.tr(args: [e.message]),
          isLoading: false,
        ),
      );
    } on Object catch (e, _) {
      emit(
        state.copyWith(
          error: 'failedToDeleteDocument'.tr(args: [doc.fileName]),
          isLoading: false,
        ),
      );
    }
    router.pop();
  }

  /// Rename file
  Future<void> renameDocument({
    required PdfFileEntity pdf,
    required String? newName,
  }) async {
    final oldFile = File(pdf.filePath);
    if (!oldFile.existsSync()) {
      emit(state.copyWith(error: 'noFile'.tr()));
      return;
    }
    if (!oldFile.existsSync() || newName == null) {
      emit(state.copyWith(error: 'emptyField'.tr()));
      return;
    }
    final dir = oldFile.parent.path;
    final extension = p.extension(pdf.filePath);
    final newFilePath = p.join(dir, '$newName$extension');
    final newFile = await oldFile.rename(newFilePath);
    final updatedPdf = pdf.copyWith(
      fileName: '$newName$extension',
      filePath: newFile.path,
    );
    objectBox.pdfBox.put(updatedPdf);
    getPdfDocuments();
    router.pop();
  }
}

/// Copy with
extension PdfFileEntityCopyWith on PdfFileEntity {
  /// method
  PdfFileEntity copyWith({
    int? id,
    String? fileName,
    String? filePath,
    DateTime? dateTime,
  }) {
    return PdfFileEntity(
      id: id ?? this.id,
      fileName: fileName ?? this.fileName,
      filePath: filePath ?? this.filePath,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}
