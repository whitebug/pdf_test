import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pdf_test/core/locator/injectable_config.config.dart';

/// Locator
final GetIt getIt = GetIt.instance;

/// Init
@InjectableInit()
void configureDependencies() => getIt.init();
