import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_scaffold/core/models/dto/name_url_dto.dart';

part 'flavor_text_dto.freezed.dart';
part 'flavor_text_dto.g.dart';

@freezed
class FlavorTextDTO with _$FlavorTextDTO {
  const factory FlavorTextDTO({
    @Default(null) @JsonKey(name: 'flavor_text') String? flavorText,
    @Default(null) NameUrlDTO? language,
    @Default(null) NameUrlDTO? version,
  }) = _FlavorTextDTO;

  factory FlavorTextDTO.fromJson(Map<String, dynamic> json) => _$FlavorTextDTOFromJson(json);
}
