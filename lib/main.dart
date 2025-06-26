import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_test/core/core.dart';
import 'package:pdf_test/core/object_box/object_box.dart';

Future<void> main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      configureDependencies();
      await ScreenUtil.ensureScreenSize();
      await EasyLocalization.ensureInitialized();
      objectBox = await ObjectBox.create();
      Bloc.observer = AppBlocObserver();
      runApp(
        EasyLocalization(
          supportedLocales: const [
            Locale('en'),
            Locale('ru'),
            Locale('de'),
            Locale('pt'),
            Locale('es'),
            Locale('fr'),
            Locale('it'),
          ],
          useOnlyLangCode: true,
          path: 'assets/translations',
          fallbackLocale: const Locale('en'),
          child: const PdfApp(),
        ),
      );
    },
    (exception, stack) {
      log(exception.toString(), stackTrace: stack);
    },
  );
}
