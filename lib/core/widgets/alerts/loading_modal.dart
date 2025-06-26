import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pdf_test/core/core.dart';
import 'package:pdf_test/ui_assets/assets.gen.dart';

/// Loading
class LoadingModal extends StatelessWidget {
  /// Constructor
  const LoadingModal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlurredModal(
      modal: SizedBox.expand(
        child: Column(
          children: [
            SizedSBox(
              height: 33.82,
              width: 150,
              child: Assets.images.logo.image(),
            ),
            Text('oneMoment', style: AppText.body).tr(),
          ],
        ),
      ),
    );
  }
}
