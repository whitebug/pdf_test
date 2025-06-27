import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pdf_test/core/core.dart';
import 'package:pdf_test/features/home/home.dart';
import 'package:pdf_test/ui_assets/assets.gen.dart';

/// Pdf list
class HomeList extends StatelessWidget {
  /// Init
  const HomeList({required this.fileList, super.key});

  /// File list
  final List<PdfFileEntity> fileList;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
      sliver: SliverToBoxAdapter(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.filler,
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow.withValues(alpha: 0.04),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: EdgeInsets.all(18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('documents'.tr(), style: AppText.heading),
                  const Spacer(),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          context.read<HomeCubit>().changeSort();
                        },
                        child: state.isDesc
                            ? Assets.images.sortFalse.image(
                                width: 34.w,
                                height: 34.w,
                              )
                            : Assets.images.sortTrue.image(
                                width: 34.w,
                                height: 34.w,
                              ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              ...List.generate(
                fileList.length,
                (i) => Padding(
                  padding: EdgeInsets.only(
                    bottom: i == fileList.length - 1 ? 0 : 16.h,
                  ),
                  child: _PdfTile(file: fileList[i]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PdfTile extends StatelessWidget {
  const _PdfTile({required this.file});

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
            onTap: () =>
                context.push('/home_page/pdf_preview', extra: file.filePath),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Assets.images.doc.image(width: 49.w, height: 63.39.h),
            ),
          ),
          const SizedSBox(width: 16),
          Expanded(
            child: GestureDetector(
              onTap: () =>
                  context.push('/home_page/pdf_preview', extra: file.filePath),
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
