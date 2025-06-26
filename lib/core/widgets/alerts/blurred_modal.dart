import 'dart:ui';

import 'package:flutter/material.dart';

/// Blurred modal background
class BlurredModal extends StatelessWidget {
  /// Constructor
  const BlurredModal({
    required this.modal,
    super.key,
  });

  /// Modal window
  final Widget modal;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: modal,
    );
  }
}
