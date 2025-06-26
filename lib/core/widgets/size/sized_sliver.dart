import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Sized box for slivers
class SizedSliver extends StatelessWidget {
  /// Init
  const SizedSliver({
    this.width,
    this.height,
    this.child,
    super.key,
  });

  /// Width
  final double? width;

  /// Height
  final double? height;

  /// Child
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height?.h,
        width: width?.w,
        child: child,
      ),
    );
  }
}
