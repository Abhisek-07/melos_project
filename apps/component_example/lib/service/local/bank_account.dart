import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'bank_account.freezed.dart';
part 'bank_account.g.dart';

@unfreezed
class BankAccount with _$BankAccount {
  factory BankAccount({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'money') required final String money,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'name') required final String name,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'accountNumber') required final String accountNumber,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'ifsc') required final String ifsc,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'icon') required final String icon,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'isDefault') required bool isDefault,
  }) = _BankAccount;

  factory BankAccount.fromJson(Map<String, dynamic> json) =>
      _$BankAccountFromJson(json);
}
