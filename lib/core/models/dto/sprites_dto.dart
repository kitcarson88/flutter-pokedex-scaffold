import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_scaffold/core/models/dto/other_dto.dart';

part 'sprites_dto.freezed.dart';
part 'sprites_dto.g.dart';

@freezed
class SpritesDTO with _$SpritesDTO {
  const factory SpritesDTO({
    @Default(null) @JsonKey(name: 'back_default') String? backDefault,
    @Default(null) @JsonKey(name: 'back_female') String? backFemale,
    @Default(null) @JsonKey(name: 'back_shiny') String? backShiny,
    @Default(null) @JsonKey(name: 'back_shiny_female') String? backShinyFemale,
    @Default(null) @JsonKey(name: 'front_default') String? frontDefault,
    @Default(null) @JsonKey(name: 'front_female') String? frontFemale,
    @Default(null) @JsonKey(name: 'front_shiny') String? frontShiny,
    @Default(null) @JsonKey(name: 'front_shiny_female') String? frontShinyFemale,
    @Default(null) OtherDTO? other,
  }) = _SpritesDTO;

  factory SpritesDTO.fromJson(Map<String, dynamic> json) => _$SpritesDTOFromJson(json);
}
