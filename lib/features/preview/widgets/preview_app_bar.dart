import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart' as p;
import 'package:pdf_test/core/core.dart';
import 'package:pdf_test/features/preview/preview.dart';
import 'package:pdf_test/ui_assets/assets.gen.dart';

/// App bar
class PreviewAppBar extends StatelessWidget {
  /// Init
  const PreviewAppBar({
    this.fileName,
    this.path,
    this.currentPage,
    this.overallPages,
    super.key,
  });

  /// Name
  final String? fileName;

  /// File path
  final String? path;

  /// Current
  final int? currentPage;

  /// Overall
  final int? overallPages;

  @override
  Widget build(BuildContext context) {
    final page = (currentPage ?? 0) + 1;
    return Container(
      margin: EdgeInsetsS.symmetric(horizontal: 18, vertical: 8),
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.filler,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withValues(alpha: 0.1),
            blurRadius: 4.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.text),
            onPressed: () => context.pop(),
          ),
          if (fileName != null)
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: Text(
                '${p.basenameWithoutExtension(fileName!)} $overallPages',
                style: AppText.body,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          const SizedBox(width: 8),
          Text(
            '|',
            style: AppText.subHeadingInactive,
          ),
          const SizedBox(width: 8),
          Text(
            'previewPages',
            style: AppText.subHeadingInactive,
          ).tr(
            namedArgs: {
              'current': '$page',
              'overall': '${overallPages ?? 1}',
            },
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              context.read<PreviewCubit>().sharePdf(path);
            },
            child: Row(
              children: [
                Text(
                  'share',
                  style: AppText.accentHeading,
                ).tr(),
                const SizedSBox(width: 4),
                Assets.images.share.image(width: 24.w, height: 24.w),
                const SizedSBox(width: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
