// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Option _$OptionFromJson(Map<String, dynamic> json) {
  return _Option.fromJson(json);
}

/// @nodoc
mixin _$Option {
// ignore: invalid_annotation_target
  @JsonKey(name: 'name')
  String get name =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'icon')
  String get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OptionCopyWith<Option> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionCopyWith<$Res> {
  factory $OptionCopyWith(Option value, $Res Function(Option) then) =
      _$OptionCopyWithImpl<$Res, Option>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name, @JsonKey(name: 'icon') String icon});
}

/// @nodoc
class _$OptionCopyWithImpl<$Res, $Val extends Option>
    implements $OptionCopyWith<$Res> {
  _$OptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OptionCopyWith<$Res> implements $OptionCopyWith<$Res> {
  factory _$$_OptionCopyWith(_$_Option value, $Res Function(_$_Option) then) =
      __$$_OptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name, @JsonKey(name: 'icon') String icon});
}

/// @nodoc
class __$$_OptionCopyWithImpl<$Res>
    extends _$OptionCopyWithImpl<$Res, _$_Option>
    implements _$$_OptionCopyWith<$Res> {
  __$$_OptionCopyWithImpl(_$_Option _value, $Res Function(_$_Option) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
  }) {
    return _then(_$_Option(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Option with DiagnosticableTreeMixin implements _Option {
  _$_Option(
      {@JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'icon') required this.icon});

  factory _$_Option.fromJson(Map<String, dynamic> json) =>
      _$$_OptionFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'name')
  final String name;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'icon')
  final String icon;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Option(name: $name, icon: $icon)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Option'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('icon', icon));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Option &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OptionCopyWith<_$_Option> get copyWith =>
      __$$_OptionCopyWithImpl<_$_Option>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OptionToJson(
      this,
    );
  }
}

abstract class _Option implements Option {
  factory _Option(
      {@JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'icon') required final String icon}) = _$_Option;

  factory _Option.fromJson(Map<String, dynamic> json) = _$_Option.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'name')
  String get name;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'icon')
  String get icon;
  @override
  @JsonKey(ignore: true)
  _$$_OptionCopyWith<_$_Option> get copyWith =>
      throw _privateConstructorUsedError;
}
