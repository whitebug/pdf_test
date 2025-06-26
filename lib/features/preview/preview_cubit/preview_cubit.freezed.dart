// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preview_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PreviewState {

 int get currentPage; int get overallPages; bool get isReady; Uint8List? get imageBytes;
/// Create a copy of PreviewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreviewStateCopyWith<PreviewState> get copyWith => _$PreviewStateCopyWithImpl<PreviewState>(this as PreviewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreviewState&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.overallPages, overallPages) || other.overallPages == overallPages)&&(identical(other.isReady, isReady) || other.isReady == isReady)&&const DeepCollectionEquality().equals(other.imageBytes, imageBytes));
}


@override
int get hashCode => Object.hash(runtimeType,currentPage,overallPages,isReady,const DeepCollectionEquality().hash(imageBytes));

@override
String toString() {
  return 'PreviewState(currentPage: $currentPage, overallPages: $overallPages, isReady: $isReady, imageBytes: $imageBytes)';
}


}

/// @nodoc
abstract mixin class $PreviewStateCopyWith<$Res>  {
  factory $PreviewStateCopyWith(PreviewState value, $Res Function(PreviewState) _then) = _$PreviewStateCopyWithImpl;
@useResult
$Res call({
 int currentPage, int overallPages, bool isReady, Uint8List? imageBytes
});




}
/// @nodoc
class _$PreviewStateCopyWithImpl<$Res>
    implements $PreviewStateCopyWith<$Res> {
  _$PreviewStateCopyWithImpl(this._self, this._then);

  final PreviewState _self;
  final $Res Function(PreviewState) _then;

/// Create a copy of PreviewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPage = null,Object? overallPages = null,Object? isReady = null,Object? imageBytes = freezed,}) {
  return _then(_self.copyWith(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,overallPages: null == overallPages ? _self.overallPages : overallPages // ignore: cast_nullable_to_non_nullable
as int,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,imageBytes: freezed == imageBytes ? _self.imageBytes : imageBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}

}


/// @nodoc


class _State implements PreviewState {
  const _State({this.currentPage = 0, this.overallPages = 1, this.isReady = false, this.imageBytes});
  

@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int overallPages;
@override@JsonKey() final  bool isReady;
@override final  Uint8List? imageBytes;

/// Create a copy of PreviewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateCopyWith<_State> get copyWith => __$StateCopyWithImpl<_State>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _State&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.overallPages, overallPages) || other.overallPages == overallPages)&&(identical(other.isReady, isReady) || other.isReady == isReady)&&const DeepCollectionEquality().equals(other.imageBytes, imageBytes));
}


@override
int get hashCode => Object.hash(runtimeType,currentPage,overallPages,isReady,const DeepCollectionEquality().hash(imageBytes));

@override
String toString() {
  return 'PreviewState.state(currentPage: $currentPage, overallPages: $overallPages, isReady: $isReady, imageBytes: $imageBytes)';
}


}

/// @nodoc
abstract mixin class _$StateCopyWith<$Res> implements $PreviewStateCopyWith<$Res> {
  factory _$StateCopyWith(_State value, $Res Function(_State) _then) = __$StateCopyWithImpl;
@override @useResult
$Res call({
 int currentPage, int overallPages, bool isReady, Uint8List? imageBytes
});




}
/// @nodoc
class __$StateCopyWithImpl<$Res>
    implements _$StateCopyWith<$Res> {
  __$StateCopyWithImpl(this._self, this._then);

  final _State _self;
  final $Res Function(_State) _then;

/// Create a copy of PreviewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPage = null,Object? overallPages = null,Object? isReady = null,Object? imageBytes = freezed,}) {
  return _then(_State(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,overallPages: null == overallPages ? _self.overallPages : overallPages // ignore: cast_nullable_to_non_nullable
as int,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,imageBytes: freezed == imageBytes ? _self.imageBytes : imageBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}


}

// dart format on
