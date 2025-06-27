import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:pdf_test/core/core.dart';
import 'package:pdf_test/features/onboarding/onboarding.dart';
import 'package:pdf_test/ui_assets/assets.gen.dart';

/// Onboarding
class OnboardingScreen extends StatefulWidget {
  /// Init
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageCtrl = PageController();
  int _pageIndex = 0;

  Future<void> _maybeAskForReview() async {
    if (_pageIndex == 1) {
      final review = InAppReview.instance;
      if (await review.isAvailable()) {
        await review.requestReview();
      }
    }
  }

  Future<void> _onContinue() async {
    if (_pageIndex < 1) {
      await _pageCtrl.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      setState(() => _pageIndex = 1);
      await _maybeAskForReview();
    } else {
      await completeOnboarding();
      router.go('/home_page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.filler,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.filler,
          body: Stack(
            children: [
              PageView(
                controller: _pageCtrl,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  OnboardingPage(
                    title: 'PDF Scanner',
                    subtitle: 'scanOrConvert'.tr(),
                    backgroundImage: Assets.images.onboard1.image(
                      width: 330.w,
                      height: 418.h,
                    ),
                  ),
                  OnboardingPage(
                    title: 'rateUs'.tr(),
                    subtitle: 'improveFeedback'.tr(),
                    backgroundImage: Assets.images.onboard2.image(),
                  ),
                ],
              ),
              Positioned(
                left: 28.w,
                top: 60.h,
                child: Column(
                  children: [
                    OnboardingDot(isActive: _pageIndex == 0),
                    const SizedSBox(height: 8),
                    OnboardingDot(isActive: _pageIndex == 1),
                    const SizedSBox(height: 8),
                    OnboardingDot(isActive: _pageIndex == 2),
                    const SizedSBox(height: 8),
                    OnboardingDot(isActive: _pageIndex == 3),
                  ],
                ),
              ),
              Positioned(
                left: 24,
                right: 24,
                bottom: 34,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    elevation: 6,
                    minimumSize: Size.fromHeight(56.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.sp),
                    ),
                  ),
                  onPressed: _onContinue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'continue',
                        style: AppText.subHeadingInactive.copyWith(
                          color: AppColors.filler,
                        ),
                      ).tr(),
                      const SizedSBox(width: 12),
                      Assets.images.rightArrow.image(
                        width: 46.33.w,
                        height: 16.33.h,
                      ),
                    ],
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
