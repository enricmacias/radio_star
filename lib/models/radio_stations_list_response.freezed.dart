// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radio_stations_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RadioStationsListResponse {

 int get totalCount; List<RadioStation> get radioStations;
/// Create a copy of RadioStationsListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadioStationsListResponseCopyWith<RadioStationsListResponse> get copyWith => _$RadioStationsListResponseCopyWithImpl<RadioStationsListResponse>(this as RadioStationsListResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadioStationsListResponse&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&const DeepCollectionEquality().equals(other.radioStations, radioStations));
}


@override
int get hashCode => Object.hash(runtimeType,totalCount,const DeepCollectionEquality().hash(radioStations));

@override
String toString() {
  return 'RadioStationsListResponse(totalCount: $totalCount, radioStations: $radioStations)';
}


}

/// @nodoc
abstract mixin class $RadioStationsListResponseCopyWith<$Res>  {
  factory $RadioStationsListResponseCopyWith(RadioStationsListResponse value, $Res Function(RadioStationsListResponse) _then) = _$RadioStationsListResponseCopyWithImpl;
@useResult
$Res call({
 int totalCount, List<RadioStation> radioStations
});




}
/// @nodoc
class _$RadioStationsListResponseCopyWithImpl<$Res>
    implements $RadioStationsListResponseCopyWith<$Res> {
  _$RadioStationsListResponseCopyWithImpl(this._self, this._then);

  final RadioStationsListResponse _self;
  final $Res Function(RadioStationsListResponse) _then;

/// Create a copy of RadioStationsListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalCount = null,Object? radioStations = null,}) {
  return _then(_self.copyWith(
totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,radioStations: null == radioStations ? _self.radioStations : radioStations // ignore: cast_nullable_to_non_nullable
as List<RadioStation>,
  ));
}

}


/// @nodoc


class _RadioStationsListResponse implements RadioStationsListResponse {
   _RadioStationsListResponse({required this.totalCount, required final  List<RadioStation> radioStations}): _radioStations = radioStations;
  

@override final  int totalCount;
 final  List<RadioStation> _radioStations;
@override List<RadioStation> get radioStations {
  if (_radioStations is EqualUnmodifiableListView) return _radioStations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_radioStations);
}


/// Create a copy of RadioStationsListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RadioStationsListResponseCopyWith<_RadioStationsListResponse> get copyWith => __$RadioStationsListResponseCopyWithImpl<_RadioStationsListResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RadioStationsListResponse&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&const DeepCollectionEquality().equals(other._radioStations, _radioStations));
}


@override
int get hashCode => Object.hash(runtimeType,totalCount,const DeepCollectionEquality().hash(_radioStations));

@override
String toString() {
  return 'RadioStationsListResponse(totalCount: $totalCount, radioStations: $radioStations)';
}


}

/// @nodoc
abstract mixin class _$RadioStationsListResponseCopyWith<$Res> implements $RadioStationsListResponseCopyWith<$Res> {
  factory _$RadioStationsListResponseCopyWith(_RadioStationsListResponse value, $Res Function(_RadioStationsListResponse) _then) = __$RadioStationsListResponseCopyWithImpl;
@override @useResult
$Res call({
 int totalCount, List<RadioStation> radioStations
});




}
/// @nodoc
class __$RadioStationsListResponseCopyWithImpl<$Res>
    implements _$RadioStationsListResponseCopyWith<$Res> {
  __$RadioStationsListResponseCopyWithImpl(this._self, this._then);

  final _RadioStationsListResponse _self;
  final $Res Function(_RadioStationsListResponse) _then;

/// Create a copy of RadioStationsListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalCount = null,Object? radioStations = null,}) {
  return _then(_RadioStationsListResponse(
totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,radioStations: null == radioStations ? _self._radioStations : radioStations // ignore: cast_nullable_to_non_nullable
as List<RadioStation>,
  ));
}


}

// dart format on
