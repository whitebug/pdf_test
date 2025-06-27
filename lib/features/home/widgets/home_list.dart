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
                  BlocListener<HomeCubit, HomeState>(
                    listenWhen: (previous, current) =>
                        previous.isLoading != current.isLoading ||
                        previous.error != current.error,
                    listener: (context, state) {
                      final router = GoRouter.of(context);
                      if (state.isLoading) {
                        router.push('/loading_modal');
                      } else {
                        if (router.canPop()) {
                          router.pop();
                        }
                      }
                      if (state.error != null) {
                        HomeUtils.showHomeDialog(
                          context: context,
                          title: Text(state.error!, style: AppText.subHeading),
                          button: Text(
                            'cancel',
                            style: AppText.subHeadingInactive,
                          ).tr(),
                        );
                      }
                    },
                    child: const Spacer(),
                  ),
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
                  child: PdfTile(file: fileList[i]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
