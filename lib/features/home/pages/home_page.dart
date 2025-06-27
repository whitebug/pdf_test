import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_test/core/core.dart';
import 'package:pdf_test/features/home/home.dart';
import 'package:pdf_test/ui_assets/assets.gen.dart';

/// Main page
class HomePage extends StatefulWidget {
  /// Init
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController searchController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getPdfDocuments();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.background,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Stack(
                alignment: Alignment.topCenter,
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        pinned: true,
                        backgroundColor: AppColors.background,
                        automaticallyImplyLeading: false,
                        collapsedHeight: 160.h,
                        expandedHeight: 160.h,
                        toolbarHeight: 0,
                        elevation: 0,
                        scrolledUnderElevation: 0,
                        surfaceTintColor: Colors.transparent,
                        flexibleSpace: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30),
                            SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  const SizedBox(width: 20),
                                  SizedBox(
                                    height: 33.82,
                                    child: Assets.images.logo.image(),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsS.all(18),
                              child: RoundedTextField(
                                controller: searchController,
                                height: 52.h,
                                focusNode: focusNode,
                                onTapOutside: (_) => focusNode.unfocus(),
                                onChanged: (query) {
                                  context.read<HomeCubit>().searchItems(
                                    query: query,
                                  );
                                },
                                hintTextStr: 'searchHint'.tr(),
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(right: 22.w),
                                  child: searchController.text.isEmpty
                                      ? Assets.images.search.image(
                                          width: 24.sp,
                                          height: 24.sp,
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            searchController.clear();
                                            context
                                                .read<HomeCubit>()
                                                .searchItems();
                                          },
                                          child: Assets.images.cross.image(
                                            width: 24.sp,
                                            height: 24.sp,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (state.pdfList.isEmpty)
                        SliverPadding(
                          padding: EdgeInsetsS.symmetric(
                            horizontal: 18,
                            vertical: 8,
                          ),
                          sliver: SliverToBoxAdapter(
                            child: NothingCard(
                              header: Text(
                                'documents',
                                style: AppText.heading,
                              ).tr(),
                            ),
                          ),
                        ),
                      if (state.pdfList.isNotEmpty)
                        HomeList(fileList: state.pdfFilteredList),
                      const SizedSliver(height: 100),
                    ],
                  ),
                  Positioned(
                    bottom: 11.h,
                    child: ScanMenu(
                      onMainTap: () {
                        context.read<HomeCubit>().scanDocument();
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
