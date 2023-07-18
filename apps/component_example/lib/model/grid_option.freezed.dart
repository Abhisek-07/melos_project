// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grid_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GridOption _$GridOptionFromJson(Map<String, dynamic> json) {
  return _GridOption.fromJson(json);
}

/// @nodoc
mixin _$GridOption {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon')
  String get icon => throw _privateConstructorUsedError;
  @JsonKey(name: 'isComingSoon')
  bool get isComingSoon => throw _privateConstructorUsedError;
  @JsonKey(name: 'isComingSoon')
  set isComingSoon(bool value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'isPinned')
  bool get isPinned => throw _privateConstructorUsedError;
  @JsonKey(name: 'isPinned')
  set isPinned(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GridOptionCopyWith<GridOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GridOptionCopyWith<$Res> {
  factory $GridOptionCopyWith(
          GridOption value, $Res Function(GridOption) then) =
      _$GridOptionCopyWithImpl<$Res, GridOption>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'icon') String icon,
      @JsonKey(name: 'isComingSoon') bool isComingSoon,
      @JsonKey(name: 'isPinned') bool isPinned});
}

/// @nodoc
class _$GridOptionCopyWithImpl<$Res, $Val extends GridOption>
    implements $GridOptionCopyWith<$Res> {
  _$GridOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
    Object? isComingSoon = null,
    Object? isPinned = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      isComingSoon: null == isComingSoon
          ? _value.isComingSoon
          : isComingSoon // ignore: cast_nullable_to_non_nullable
              as bool,
      isPinned: null == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GridOptionCopyWith<$Res>
    implements $GridOptionCopyWith<$Res> {
  factory _$$_GridOptionCopyWith(
          _$_GridOption value, $Res Function(_$_GridOption) then) =
      __$$_GridOptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'icon') String icon,
      @JsonKey(name: 'isComingSoon') bool isComingSoon,
      @JsonKey(name: 'isPinned') bool isPinned});
}

/// @nodoc
class __$$_GridOptionCopyWithImpl<$Res>
    extends _$GridOptionCopyWithImpl<$Res, _$_GridOption>
    implements _$$_GridOptionCopyWith<$Res> {
  __$$_GridOptionCopyWithImpl(
      _$_GridOption _value, $Res Function(_$_GridOption) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
    Object? isComingSoon = null,
    Object? isPinned = null,
  }) {
    return _then(_$_GridOption(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      isComingSoon: null == isComingSoon
          ? _value.isComingSoon
          : isComingSoon // ignore: cast_nullable_to_non_nullable
              as bool,
      isPinned: null == isPinned
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GridOption implements _GridOption {
  _$_GridOption(
      {@JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'icon') required this.icon,
      @JsonKey(name: 'isComingSoon') required this.isComingSoon,
      @JsonKey(name: 'isPinned') required this.isPinned});

  factory _$_GridOption.fromJson(Map<String, dynamic> json) =>
      _$$_GridOptionFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'icon')
  final String icon;
  @override
  @JsonKey(name: 'isComingSoon')
  bool isComingSoon;
  @override
  @JsonKey(name: 'isPinned')
  bool isPinned;

  @override
  String toString() {
    return 'GridOption(name: $name, icon: $icon, isComingSoon: $isComingSoon, isPinned: $isPinned)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GridOptionCopyWith<_$_GridOption> get copyWith =>
      __$$_GridOptionCopyWithImpl<_$_GridOption>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GridOptionToJson(
      this,
    );
  }
}

abstract class _GridOption implements GridOption {
  factory _GridOption(
      {@JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'icon') required final String icon,
      @JsonKey(name: 'isComingSoon') required bool isComingSoon,
      @JsonKey(name: 'isPinned') required bool isPinned}) = _$_GridOption;

  factory _GridOption.fromJson(Map<String, dynamic> json) =
      _$_GridOption.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'icon')
  String get icon;
  @override
  @JsonKey(name: 'isComingSoon')
  bool get isComingSoon;
  @JsonKey(name: 'isComingSoon')
  set isComingSoon(bool value);
  @override
  @JsonKey(name: 'isPinned')
  bool get isPinned;
  @JsonKey(name: 'isPinned')
  set isPinned(bool value);
  @override
  @JsonKey(ignore: true)
  _$$_GridOptionCopyWith<_$_GridOption> get copyWith =>
      throw _privateConstructorUsedError;
}
