// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BankAccount _$BankAccountFromJson(Map<String, dynamic> json) {
  return _BankAccount.fromJson(json);
}

/// @nodoc
mixin _$BankAccount {
  @JsonKey(name: 'money')
  String get money => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'accountNumber')
  String get accountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'ifsc')
  String get ifsc => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon')
  String get icon => throw _privateConstructorUsedError;
  @JsonKey(name: 'isDefault')
  bool get isDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'isDefault')
  set isDefault(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankAccountCopyWith<BankAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankAccountCopyWith<$Res> {
  factory $BankAccountCopyWith(
          BankAccount value, $Res Function(BankAccount) then) =
      _$BankAccountCopyWithImpl<$Res, BankAccount>;
  @useResult
  $Res call(
      {@JsonKey(name: 'money') String money,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'accountNumber') String accountNumber,
      @JsonKey(name: 'ifsc') String ifsc,
      @JsonKey(name: 'icon') String icon,
      @JsonKey(name: 'isDefault') bool isDefault});
}

/// @nodoc
class _$BankAccountCopyWithImpl<$Res, $Val extends BankAccount>
    implements $BankAccountCopyWith<$Res> {
  _$BankAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? money = null,
    Object? name = null,
    Object? accountNumber = null,
    Object? ifsc = null,
    Object? icon = null,
    Object? isDefault = null,
  }) {
    return _then(_value.copyWith(
      money: null == money
          ? _value.money
          : money // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      ifsc: null == ifsc
          ? _value.ifsc
          : ifsc // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BankAccountCopyWith<$Res>
    implements $BankAccountCopyWith<$Res> {
  factory _$$_BankAccountCopyWith(
          _$_BankAccount value, $Res Function(_$_BankAccount) then) =
      __$$_BankAccountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'money') String money,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'accountNumber') String accountNumber,
      @JsonKey(name: 'ifsc') String ifsc,
      @JsonKey(name: 'icon') String icon,
      @JsonKey(name: 'isDefault') bool isDefault});
}

/// @nodoc
class __$$_BankAccountCopyWithImpl<$Res>
    extends _$BankAccountCopyWithImpl<$Res, _$_BankAccount>
    implements _$$_BankAccountCopyWith<$Res> {
  __$$_BankAccountCopyWithImpl(
      _$_BankAccount _value, $Res Function(_$_BankAccount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? money = null,
    Object? name = null,
    Object? accountNumber = null,
    Object? ifsc = null,
    Object? icon = null,
    Object? isDefault = null,
  }) {
    return _then(_$_BankAccount(
      money: null == money
          ? _value.money
          : money // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      ifsc: null == ifsc
          ? _value.ifsc
          : ifsc // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BankAccount with DiagnosticableTreeMixin implements _BankAccount {
  _$_BankAccount(
      {@JsonKey(name: 'money') required this.money,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'accountNumber') required this.accountNumber,
      @JsonKey(name: 'ifsc') required this.ifsc,
      @JsonKey(name: 'icon') required this.icon,
      @JsonKey(name: 'isDefault') required this.isDefault});

  factory _$_BankAccount.fromJson(Map<String, dynamic> json) =>
      _$$_BankAccountFromJson(json);

  @override
  @JsonKey(name: 'money')
  final String money;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'accountNumber')
  final String accountNumber;
  @override
  @JsonKey(name: 'ifsc')
  final String ifsc;
  @override
  @JsonKey(name: 'icon')
  final String icon;
  @override
  @JsonKey(name: 'isDefault')
  bool isDefault;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BankAccount(money: $money, name: $name, accountNumber: $accountNumber, ifsc: $ifsc, icon: $icon, isDefault: $isDefault)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BankAccount'))
      ..add(DiagnosticsProperty('money', money))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('accountNumber', accountNumber))
      ..add(DiagnosticsProperty('ifsc', ifsc))
      ..add(DiagnosticsProperty('icon', icon))
      ..add(DiagnosticsProperty('isDefault', isDefault));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BankAccountCopyWith<_$_BankAccount> get copyWith =>
      __$$_BankAccountCopyWithImpl<_$_BankAccount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BankAccountToJson(
      this,
    );
  }
}

abstract class _BankAccount implements BankAccount {
  factory _BankAccount(
      {@JsonKey(name: 'money') required final String money,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'accountNumber') required final String accountNumber,
      @JsonKey(name: 'ifsc') required final String ifsc,
      @JsonKey(name: 'icon') required final String icon,
      @JsonKey(name: 'isDefault') required bool isDefault}) = _$_BankAccount;

  factory _BankAccount.fromJson(Map<String, dynamic> json) =
      _$_BankAccount.fromJson;

  @override
  @JsonKey(name: 'money')
  String get money;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'accountNumber')
  String get accountNumber;
  @override
  @JsonKey(name: 'ifsc')
  String get ifsc;
  @override
  @JsonKey(name: 'icon')
  String get icon;
  @override
  @JsonKey(name: 'isDefault')
  bool get isDefault;
  @JsonKey(name: 'isDefault')
  set isDefault(bool value);
  @override
  @JsonKey(ignore: true)
  _$$_BankAccountCopyWith<_$_BankAccount> get copyWith =>
      throw _privateConstructorUsedError;
}
