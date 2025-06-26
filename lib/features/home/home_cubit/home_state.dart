part of 'home_cubit.dart';

/// State
@freezed
abstract class HomeState with _$HomeState {
  /// State
  const factory HomeState.state({
    @Default([]) List<PdfFileEntity> pdfList,
    @Default([]) List<PdfFileEntity> pdfFilteredList,
    @Default(false) bool isLoading,
    @Default(true) bool isDesc,
    String? readPdfError,
  }) = _HomeState;
}
