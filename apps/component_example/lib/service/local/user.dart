import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'id') required String id,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'name') required String name,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'accountNumber') required String accountNumber,
    // ignore: invalid_annotation_target
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
