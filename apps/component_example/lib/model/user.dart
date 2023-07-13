// class User {
//   User(
//       {required this.id,
//       required this.name,
//       required this.accountNumber,
//       required this.ifsc});

//   final String id;
//   final String name;
//   final String accountNumber;
//   final String ifsc;

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       name: json['name'],
//       accountNumber: json['accountNumber'],
//       ifsc: json['ifsc'],
//     );
//   }

//   factory User.empty() {
//     return User(
//       id: '',
//       name: '',
//       accountNumber: '',
//       ifsc: '',
//     );
//   }
// }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'accountNumber') required String accountNumber,
    @JsonKey(name: 'ifsc') required String ifsc,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.empty() {
    return User(
      id: '',
      name: '',
      accountNumber: '',
      ifsc: '',
    );
  }
}
