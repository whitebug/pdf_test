import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'preview_state.dart';
part 'preview_cubit.freezed.dart';

/// Preview logic
@injectable
class PreviewCubit extends Cubit<PreviewState> {
  /// Init
  PreviewCubit() : super(const PreviewState.state());
}
