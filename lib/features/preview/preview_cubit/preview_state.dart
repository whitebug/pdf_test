part of 'preview_cubit.dart';

/// State
@freezed
abstract class PreviewState with _$PreviewState {
  /// State
  const factory PreviewState.state({
    @Default(0) int currentPage,
    @Default(1) int overallPages,
    @Default(false) bool isReady,
  }) = _State;
}
