import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'option.freezed.dart';
part 'option.g.dart';

// class Option {
//   final String name;
//   final String icon;

//   Option({
//     required this.name,
//     required this.icon,
//   });

//   factory Option.fromJson(Map<String, dynamic> json) {
//     return Option(
//       name: json['name'],
//       icon: json['icon'],
//     );
//   }
// }

@freezed
class Option with _$Option {
  factory Option({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'icon') required String icon,
  }) = _Option;

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}
