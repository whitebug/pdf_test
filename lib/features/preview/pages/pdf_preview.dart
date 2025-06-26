import 'dart:async';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart';
import 'package:pdf_test/core/core.dart';
import 'package:pdf_test/features/preview/preview.dart';
import 'package:pdf_thumbnail/pdf_thumbnail.dart';
import 'package:pro_image_editor/pro_image_editor.dart';

/// Document preview
class PdfPreview extends StatefulWidget {
  /// Init
  const PdfPreview({
    this.path,
    super.key,
  });

  /// File path
  final String? path;

  @override
  State<PdfPreview> createState() => _PdfPreviewState();
}

class _PdfPreviewState extends State<PdfPreview> {
  final controller = Completer<PDFViewController>();
  int? overallPages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  String fileName = '';

  @override
  void initState() {
    super.initState();
    fileName = widget.path != null
        ? basename(widget.path!)
        : 'previewName'.tr();
  }

  Future<Uint8List?> editPage(
    BuildContext context,
    Uint8List bytes,
  ) async {
    return Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => ProImageEditor.memory(
          bytes,
          callbacks: ProImageEditorCallbacks(
            onImageEditingComplete: (Uint8List edited) async {
              Navigator.pop(context, edited);
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.filler,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsetsS.only(top: 90, bottom: 200),
                child: PDFView(
                  filePath: widget.path,
                  swipeHorizontal: true,
                  autoSpacing: false,
                  defaultPage: currentPage!,
                  fitPolicy: FitPolicy.BOTH,
                  backgroundColor: AppColors.background,
                  onRender: (pages) {
                    setState(() {
                      overallPages = pages;
                      isReady = true;
                    });
                  },
                  onError: (error) {
                    setState(() {
                      errorMessage = error.toString();
                    });
                  },
                  onPageError: (page, error) {
                    setState(() {
                      errorMessage = '$page: $error';
                    });
                  },
                  onViewCreated: controller.complete,
                  onPageChanged: (int? page, int? total) {
                    setState(() {
                      currentPage = page;
                    });
                  },
                ),
              ),
              if (errorMessage.isEmpty)
                !isReady
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container()
              else
                Center(
                  child: Text(errorMessage),
                ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: PreviewAppBar(
                  path: widget.path,
                  fileName: fileName,
                  currentPage: currentPage,
                  overallPages: overallPages,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: PreviewActionBar(
                  onEdit: () async {
                    await context.read<PreviewCubit>().editPdf(
                      widget.path!,
                      currentPage ?? 1,
                    );
                  },
                  onAdd: () async {
                    await context.read<PreviewCubit>().addPages(
                      pdfPath: widget.path!,
                    );
                  },
                ),
              ),
              if (widget.path != null)
                Positioned(
                  bottom: 110.h,
                  left: 18.w,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: FutureBuilder(
                      future: controller.future,
                      builder: (context, snapshot) {
                        return PdfThumbnail.fromFile(
                          widget.path!,
                          currentPage: (currentPage ?? 0) + 1,
                          backgroundColor: AppColors.background.withValues(
                            alpha: 0.5,
                          ),
                          height: 80.h,
                          currentPageDecoration: const BoxDecoration(
                            color: AppColors.filler,
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors.accent,
                                width: 10,
                              ),
                            ),
                          ),
                          currentPageWidget: (page, isCurrent) {
                            return Positioned.fill(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  border: Border.all(
                                    color: isCurrent
                                        ? AppColors.accent
                                        : AppColors.filler,
                                  ),
                                ),
                              ),
                            );
                          },
                          onPageClicked: (page) async {
                            setState(() {
                              currentPage = page;
                            });
                            await snapshot.data!.setPage(page);
                          },
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
