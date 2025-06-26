import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Insets
class EdgeInsetsS extends EdgeInsets {
  /// only
  EdgeInsetsS.only({
    double left = 0.0,
    double right = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) : super.only(left: left.r, right: right.r, top: top.r, bottom: bottom.r);

  /// all
  EdgeInsetsS.all(double value) : super.all(value.r);

  /// symmetric
  EdgeInsetsS.symmetric({
    double vertical = 0.0,
    double horizontal = 0.0,
  }) : super.symmetric(vertical: vertical.r, horizontal: horizontal.r);

  /// fromLTRB
  EdgeInsetsS.fromLTRB(
      double left,
      double top,
      double right,
      double bottom,
      ) : super.fromLTRB(left.r, top.r, right.r, bottom.r);
}