import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Adaptive sized box
class SizedSBox extends StatelessWidget {
  /// Init
  const SizedSBox({
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
    return SizedBox(
      height: height?.h,
      width: width?.w,
      child: child,
    );
  }
}
