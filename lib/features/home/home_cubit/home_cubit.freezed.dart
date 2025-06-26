// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 List<PdfFileEntity> get pdfList; List<PdfFileEntity> get pdfFilteredList; bool get isLoading; bool get isDesc; String? get readPdfError;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&const DeepCollectionEquality().equals(other.pdfList, pdfList)&&const DeepCollectionEquality().equals(other.pdfFilteredList, pdfFilteredList)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isDesc, isDesc) || other.isDesc == isDesc)&&(identical(other.readPdfError, readPdfError) || other.readPdfError == readPdfError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(pdfList),const DeepCollectionEquality().hash(pdfFilteredList),isLoading,isDesc,readPdfError);

@override
String toString() {
  return 'HomeState(pdfList: $pdfList, pdfFilteredList: $pdfFilteredList, isLoading: $isLoading, isDesc: $isDesc, readPdfError: $readPdfError)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 List<PdfFileEntity> pdfList, List<PdfFileEntity> pdfFilteredList, bool isLoading, bool isDesc, String? readPdfError
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pdfList = null,Object? pdfFilteredList = null,Object? isLoading = null,Object? isDesc = null,Object? readPdfError = freezed,}) {
  return _then(_self.copyWith(
pdfList: null == pdfList ? _self.pdfList : pdfList // ignore: cast_nullable_to_non_nullable
as List<PdfFileEntity>,pdfFilteredList: null == pdfFilteredList ? _self.pdfFilteredList : pdfFilteredList // ignore: cast_nullable_to_non_nullable
as List<PdfFileEntity>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isDesc: null == isDesc ? _self.isDesc : isDesc // ignore: cast_nullable_to_non_nullable
as bool,readPdfError: freezed == readPdfError ? _self.readPdfError : readPdfError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({final  List<PdfFileEntity> pdfList = const [], final  List<PdfFileEntity> pdfFilteredList = const [], this.isLoading = false, this.isDesc = true, this.readPdfError}): _pdfList = pdfList,_pdfFilteredList = pdfFilteredList;
  

 final  List<PdfFileEntity> _pdfList;
@override@JsonKey() List<PdfFileEntity> get pdfList {
  if (_pdfList is EqualUnmodifiableListView) return _pdfList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pdfList);
}

 final  List<PdfFileEntity> _pdfFilteredList;
@override@JsonKey() List<PdfFileEntity> get pdfFilteredList {
  if (_pdfFilteredList is EqualUnmodifiableListView) return _pdfFilteredList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pdfFilteredList);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isDesc;
@override final  String? readPdfError;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&const DeepCollectionEquality().equals(other._pdfList, _pdfList)&&const DeepCollectionEquality().equals(other._pdfFilteredList, _pdfFilteredList)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isDesc, isDesc) || other.isDesc == isDesc)&&(identical(other.readPdfError, readPdfError) || other.readPdfError == readPdfError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_pdfList),const DeepCollectionEquality().hash(_pdfFilteredList),isLoading,isDesc,readPdfError);

@override
String toString() {
  return 'HomeState.state(pdfList: $pdfList, pdfFilteredList: $pdfFilteredList, isLoading: $isLoading, isDesc: $isDesc, readPdfError: $readPdfError)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 List<PdfFileEntity> pdfList, List<PdfFileEntity> pdfFilteredList, bool isLoading, bool isDesc, String? readPdfError
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pdfList = null,Object? pdfFilteredList = null,Object? isLoading = null,Object? isDesc = null,Object? readPdfError = freezed,}) {
  return _then(_HomeState(
pdfList: null == pdfList ? _self._pdfList : pdfList // ignore: cast_nullable_to_non_nullable
as List<PdfFileEntity>,pdfFilteredList: null == pdfFilteredList ? _self._pdfFilteredList : pdfFilteredList // ignore: cast_nullable_to_non_nullable
as List<PdfFileEntity>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isDesc: null == isDesc ? _self.isDesc : isDesc // ignore: cast_nullable_to_non_nullable
as bool,readPdfError: freezed == readPdfError ? _self.readPdfError : readPdfError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
