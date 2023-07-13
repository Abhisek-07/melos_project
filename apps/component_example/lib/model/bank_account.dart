// class BankAccount {
//   BankAccount(
//       {required this.name,
//       required this.money,
//       required this.accountNumber,
//       required this.ifsc,
//       required this.icon,
//       required this.isDefault});

//   final String name;
//   final String money;
//   final String accountNumber;
//   final String ifsc;
//   final String icon;
//   bool isDefault;

//   factory BankAccount.fromJson(Map<String, dynamic> json) {
//     return BankAccount(
//       name: json['name'],
//       money: json['money'],
//       accountNumber: json['accountNumber'],
//       ifsc: json['ifsc'],
//       icon: json['icon'],
//       isDefault: json['isDefault'],
//     );
//   }
// }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'bank_account.freezed.dart';
part 'bank_account.g.dart';

@unfreezed
class BankAccount with _$BankAccount {
  factory BankAccount({
    @JsonKey(name: 'money') required final String money,
    @JsonKey(name: 'name') required final String name,
    @JsonKey(name: 'accountNumber') required final String accountNumber,
    @JsonKey(name: 'ifsc') required final String ifsc,
    @JsonKey(name: 'icon') required final String icon,
    @JsonKey(name: 'isDefault') required bool isDefault,
  }) = _BankAccount;

  factory BankAccount.fromJson(Map<String, dynamic> json) =>
      _$BankAccountFromJson(json);
}
