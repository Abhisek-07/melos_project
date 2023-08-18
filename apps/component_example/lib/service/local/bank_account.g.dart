// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BankAccount _$$_BankAccountFromJson(Map<String, dynamic> json) =>
    _$_BankAccount(
      money: json['money'] as String,
      name: json['name'] as String,
      accountNumber: json['accountNumber'] as String,
      ifsc: json['ifsc'] as String,
      icon: json['icon'] as String,
      isDefault: json['isDefault'] as bool,
    );

Map<String, dynamic> _$$_BankAccountToJson(_$_BankAccount instance) =>
    <String, dynamic>{
      'money': instance.money,
      'name': instance.name,
      'accountNumber': instance.accountNumber,
      'ifsc': instance.ifsc,
      'icon': instance.icon,
      'isDefault': instance.isDefault,
    };
