import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_test/core/core.dart';
import 'package:pdf_test/ui_assets/assets.gen.dart';

class NothingCard extends StatelessWidget {
  const NothingCard({
    this.header,
    this.subHeader,
    this.body,
    super.key,
  });

  final Widget? header;
  final Widget? subHeader;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return ShadowCard(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 40.h,
            child: Padding(
              padding: EdgeInsetsS.only(left: 60),
              child: Assets.images.nothingS.image(
                width: 250.w,
                height: 250.w,
              ),
            ),
          ),
          Column(
            children: [
              if (header != null)
                Align(
                  alignment: Alignment.topLeft,
                  child: header,
                ),
              SizedBox(height: 20.h),
              SizedBox(height: 203.73.h, width: 190.w),
              SizedBox(height: 20.h),
              Text(
                'noDocumentsFound',
                style: AppText.body,
              ).tr(),
              SizedBox(height: 8.h),
              Text(
                'tapToScan',
                textAlign: TextAlign.center,
                style: AppText.bodySmall,
              ).tr(),
            ],
          ),
        ],
      ),
    );
  }
}
