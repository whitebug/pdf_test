import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pdf_test/core/core.dart';
import 'package:pdf_test/features/home/home.dart';
import 'package:pdf_test/features/preview/preview.dart';

/// Drop down menu
class DropMenu extends StatelessWidget {
  /// Init
  const DropMenu({
    required this.file,
    super.key,
  });

  /// File
  final PdfFileEntity file;

  /// Rename file
  Future<String?> showRenameSheet(
    BuildContext context, {
    required String initial,
  }) {
    final controller = TextEditingController(text: initial);
    return showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: RenamePanel(
              controller: controller,
              onSave: () {
                Navigator.pop(context, controller.text.trim());
              },
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          onPressed: () async {
            final result = await showRenameSheet(
              initial: file.fileName.replaceAll('.pdf', ''),
              context,
            );
            await homeCubit.renameDocument(
              pdf: file,
              newName: result,
            );
          },
          child: const Text('rename').tr(),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            context.read<PreviewCubit>().printPdfFile(file.filePath);
            context.pop();
          },
          child: const Text('print').tr(),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            context.read<PreviewCubit>().sharePdf(file.filePath);
            context.pop();
          },
          child: const Text('share').tr(),
        ),
        CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: () {
            context.read<HomeCubit>().deleteDocument(file);
            context.pop();
          },
          child: const Text('delete').tr(),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        isDefaultAction: true,
        onPressed: () => context.pop(),
        child: const Text('cancel').tr(),
      ),
    );
  }
}
