import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doc_scanner/flutter_doc_scanner.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:pdf_test/core/core.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

const int _pagesToScan = 5;

/// Home logic
@injectable
class HomeCubit extends Cubit<HomeState> {
  /// Init
  HomeCubit() : super(const HomeState.state());

  /// Get all pdf documents saved previously
  void getPdfDocuments() {
    emit(state.copyWith(isLoading: true));
    try {
      final pdfList = objectBox.pdfBox.getAll();
      emit(
        state.copyWith(
          pdfList: pdfList,
          pdfFilteredList: pdfList,
          readPdfError: null,
          isLoading: false,
        ),
      );
    } on Exception catch(_) {
      emit(
        state.copyWith(
          isLoading: false,
          readPdfError: 'filesFetchError'.tr(),
        ),
      );
    }
  }

  /// Scan document
  Future<void> scanDocument() async {
    emit(state.copyWith(isLoading: true));
    dynamic scannedDocuments;
    try {
      scannedDocuments = await FlutterDocScanner().getScannedDocumentAsPdf(
        page: _pagesToScan,
      );
      if (scannedDocuments == null) {
        emit(
          state.copyWith(
            readPdfError: 'unknownPlatformDocuments'.tr(),
            isLoading: false,
          ),
        );
      }
      if (scannedDocuments == null) {
        emit(state.copyWith(isLoading: false));
        return;
      }
      final filePath = scannedDocuments as String;
      final fileName = basename(filePath);
      final pdf = PdfFileEntity(
        fileName: fileName,
        filePath: filePath,
        dateTime: DateTime.now(),
      );
      objectBox.pdfBox.put(pdf);
      getPdfDocuments();
    } on PlatformException {
      emit(
        state.copyWith(
          readPdfError: 'failedToGetScannedDocuments'.tr(),
          isLoading: false,
        ),
      );
    }
  }
}
