// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'grid_option.freezed.dart';
part 'grid_option.g.dart';

@unfreezed
class GridOption with _$GridOption {
  factory GridOption({
    @JsonKey(name: 'name') required final String name,
    @JsonKey(name: 'icon') required final String icon,
    @JsonKey(name: 'isComingSoon') required bool isComingSoon,
    @JsonKey(name: 'isPinned') required bool isPinned,
  }) = _GridOption;
  factory GridOption.fromJson(Map<String, dynamic> json) =>
      _$GridOptionFromJson(json);
}
