import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdf_test/core/core.dart';
import 'package:pdf_test/features/home/home.dart';
import 'package:pdf_test/features/preview/preview.dart';
import 'package:pro_image_editor/pro_image_editor.dart';

/// App route context key
final GlobalKey<NavigatorState> rootKey = GlobalKey<NavigatorState>();

/// App router
final router = GoRouter(
  navigatorKey: rootKey,
  routes: [
    GoRoute(path: '/', redirect: (_, _) => '/home_page'),
    GoRoute(
      parentNavigatorKey: rootKey,
      path: '/home_page',
      builder: (_, _) => const HomePage(),
      routes: [
        GoRoute(
          path: 'pdf_preview',
          builder: (context, state) {
            final path = state.extra! as String;
            return PdfPreview(path: path);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/loading_modal',
      parentNavigatorKey: rootKey,
      pageBuilder: (context, state) => IrremovableDialog(
        child: Builder(
          builder: (context) => const LoadingModal(),
        ),
      ),
    ),
    GoRoute(
      path: '/pdf_edit',
      pageBuilder: (context, state) {
        final bytes = state.extra! as Uint8List;
        return MaterialPage<void>(
          key: state.pageKey,
          fullscreenDialog: true,
          child: ProImageEditor.memory(
            bytes,
            callbacks: ProImageEditorCallbacks(
              onImageEditingComplete: (edited) async => context.pop(edited),
            ),
          ),
        );
      },
    ),
  ],
);
