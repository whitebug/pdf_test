import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pdf_test/core/core.dart';
import 'package:pdf_test/features/home/home.dart';
import 'package:pdf_test/ui_assets/assets.gen.dart';

/// Pdf list
class HomePdfList extends StatelessWidget {
  /// Init
  const HomePdfList({
    required this.fileList,
    super.key,
  });

  /// File list
  final List<PdfFileEntity> fileList;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.push(
                      '/pdf_preview',
                      extra: fileList[index].filePath,
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Assets.images.doc.image(
                      width: 49.w,
                      height: 63.39.h,
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fileList[index].fileName,
                        style: AppText.subHeading,
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        '1|${HomeUtils.getFormattedData(
                          date: fileList[index].dateTime,
                        )}',
                        style: AppText.subHeadingLight,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert, color: AppColors.accent),
                ),
              ],
            ),
          );
        },
        childCount: fileList.length,
      ),
    );
  }
}
