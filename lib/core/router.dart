import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdf_test/core/core.dart';
import 'package:pdf_test/features/home/home.dart';
import 'package:pdf_test/features/onboarding/onboarding.dart';
import 'package:pdf_test/features/preview/preview.dart';
import 'package:pro_image_editor/pro_image_editor.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _onboarding = 'onboarding_complete';

/// App route context key
final GlobalKey<NavigatorState> rootKey = GlobalKey<NavigatorState>();

/// Complete it
Future<void> completeOnboarding() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(_onboarding, true);
}

/// Check if a user completed the onboarding
Future<bool> isOnboardingComplete() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(_onboarding) ?? false;
}

/// App router
late final GoRouter router;

/// Init router
Future<void> initRouter() async {
  final onboardingDone = await isOnboardingComplete();
  router = GoRouter(
    navigatorKey: rootKey,
    routes: [
      GoRoute(
        path: '/',
        redirect: (_, _) => onboardingDone ? '/home_page' : '/onboarding',
      ),
      GoRoute(
        path: '/onboarding',
        parentNavigatorKey: rootKey,
        builder: (_, _) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/home_page',
        parentNavigatorKey: rootKey,
        builder: (_, _) => const HomePage(),
        routes: [
          GoRoute(
            path: 'pdf_preview',
            builder: (context, state) {
              final path = state.extra as PdfFileEntity?;
              return PdfPreview(file: path);
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
        parentNavigatorKey: rootKey,
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
}
