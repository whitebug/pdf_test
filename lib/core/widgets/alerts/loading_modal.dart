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
    return Material(
      color: Colors.transparent,
      child: BlurredModal(
        modal: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedSBox(
                height: 33.82,
                width: 150,
                child: Assets.images.logo.image(),
              ),
              const SizedSBox(height: 22),
              Text('oneMoment', style: AppText.body).tr(),
            ],
          ),
        ),
      ),
    );
  }
}
