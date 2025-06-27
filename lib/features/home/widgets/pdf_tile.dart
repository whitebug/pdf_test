import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pdf_test/core/core.dart';
import 'package:pdf_test/features/home/home.dart';
import 'package:pdf_test/ui_assets/assets.gen.dart';

/// Tile
class PdfTile extends StatelessWidget {
  /// Init
  const PdfTile({
    required this.file,
    super.key,
  });

  /// Pdf file
  final PdfFileEntity file;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(18.r),
      ),
      padding: EdgeInsetsS.all(12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              context.go(
                '/home_page/pdf_preview',
                extra: file,
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Assets.images.doc.image(width: 49.w, height: 63.39.h),
            ),
          ),
          const SizedSBox(width: 16),
          Expanded(
            child: GestureDetector(
              onTap: () {
                context.go(
                  '/home_page/pdf_preview',
                  extra: file,
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(file.fileName, style: AppText.subHeading),
                  SizedBox(height: 6.h),
                  Text(
                    '${file.pageNumber} |'
                    ' ${HomeUtils.getFormattedData(date: file.dateTime)}',
                    style: AppText.subHeadingLight,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.accent),
            onPressed: () {
              showCupertinoModalPopup<bool>(
                context: context,
                builder: (_) => DropMenu(file: file),
              );
            },
          ),
        ],
      ),
    );
  }
}
