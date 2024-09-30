import 'package:freezed_annotation/freezed_annotation.dart';

part 'name_url_dto.freezed.dart';
part 'name_url_dto.g.dart';

@freezed
class NameUrlDTO with _$NameUrlDTO {
  const factory NameUrlDTO({
    @Default(null) String? name,
    @Default(null) @JsonKey(name: 'translated_name') String? translatedName,
    @Default(null) String? url,
  }) = _NameUrlDTO;

  factory NameUrlDTO.fromJson(Map<String, dynamic> json) => _$NameUrlDTOFromJson(json);
}
