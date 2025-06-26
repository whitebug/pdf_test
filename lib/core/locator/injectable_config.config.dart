// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pdf_test/features/home/home_cubit/home_cubit.dart' as _i472;
import 'package:pdf_test/features/preview/preview_cubit/preview_cubit.dart'
    as _i519;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i472.HomeCubit>(() => _i472.HomeCubit());
    gh.factory<_i519.PreviewCubit>(() => _i519.PreviewCubit());
    return this;
  }
}
