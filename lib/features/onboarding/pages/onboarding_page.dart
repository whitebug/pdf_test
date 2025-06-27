import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_test/core/core.dart';
import 'package:pdf_test/ui_assets/assets.gen.dart';

/// Page
class OnboardingPage extends StatelessWidget {
  /// Init
  const OnboardingPage({
    required this.title,
    required this.subtitle,
    required this.backgroundImage,
    super.key,
  });

  /// Title
  final String title;

  /// Subtitle
  final String subtitle;

  /// Image
  final Widget backgroundImage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ColoredBox(
          color: AppColors.filler,
          child: SizedBox(
            width: size.width,
            height: size.height,
          ),
        ),
        Positioned(
          top: 97,
          right: -30,
          child: Assets.images.cubes.image(
            width: 184.57.w,
            height: 281.49.h,
          ),
        ),
        Positioned.fill(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedSBox(height: 40),
              Padding(
                padding: EdgeInsetsS.only(left: 53, right: 28),
                child: Text(
                  title,
                  style: AppText.hugeTitle,
                ),
              ),
              const SizedSBox(height: 8),
              Padding(
                padding: EdgeInsetsS.only(left: 53, right: 28),
                child: Text(
                  subtitle,
                  style: AppText.hugeSubtitle,
                ),
              ),
              const SizedSBox(height: 32),
              Padding(
                padding: EdgeInsetsS.only(left: 31, right: 32),
                child: backgroundImage,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
