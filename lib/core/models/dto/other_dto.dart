import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_scaffold/core/models/dto/sprites_dto.dart';

part 'other_dto.freezed.dart';
part 'other_dto.g.dart';

@freezed
class OtherDTO with _$OtherDTO {
  const factory OtherDTO({
    @Default(null) @JsonKey(name: 'dream_world') SpritesDTO? dreamWorld,
    @Default(null) SpritesDTO? home,
    @Default(null) @JsonKey(name: 'official-artwork') SpritesDTO? officialArtwork,
  }) = _OtherDTO;

  factory OtherDTO.fromJson(Map<String, dynamic> json) => _$OtherDTOFromJson(json);
}
