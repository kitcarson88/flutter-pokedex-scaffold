import 'package:freezed_annotation/freezed_annotation.dart';

part 'switch_dto.freezed.dart';
part 'switch_dto.g.dart';

@freezed
class SwitchDTO with _$SwitchDTO {
  const factory SwitchDTO({
    @Default(null) int? id,
    @Default(null) String? value,
  }) = _SwitchDTO;

  factory SwitchDTO.fromJson(Map<String, dynamic> json) => _$SwitchDTOFromJson(json);
}
