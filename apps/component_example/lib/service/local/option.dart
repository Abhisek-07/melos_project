import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'option.freezed.dart';
part 'option.g.dart';

@freezed
class Option with _$Option {
  factory Option({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'name') required String name,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'icon') required String icon,
  }) = _Option;

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}
